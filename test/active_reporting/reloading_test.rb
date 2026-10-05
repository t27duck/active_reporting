require 'test_helper'
require 'tmpdir'

# Boots a minimal Rails app with code reloading in a separate process and checks that fact models
# are looked up again after `reload!` instead of returning classes from before the reload.
class ActiveReporting::ReloadingTest < Minitest::Test
  APP = <<~RUBY
    require 'rails'
    require 'active_record/railtie'
    require 'active_reporting'

    # Defined outside the autoload paths, so it is not reloaded (like a model from an engine or gem)
    class Widget < ActiveRecord::Base; end

    class ReloadingApp < Rails::Application
      config.root = ARGV.fetch(0)
      config.eager_load = false
      config.enable_reloading = true
      config.logger = Logger.new(nil)
      config.secret_key_base = 'test'
      config.active_support.deprecation = :silence
    end
    Rails.application.initialize!

    old_post = Post
    old_post_fact_model = Post.fact_model
    old_widget_fact_model = Widget.fact_model
    Rails.application.reloader.reload!

    results = {
      post_was_reloaded: !Post.equal?(old_post),
      generated_fact_model_uses_new_post: Post.fact_model.model.equal?(Post),
      generated_fact_model_was_replaced: !Post.fact_model.equal?(old_post_fact_model),
      widget_uses_new_fact_model: !Widget.fact_model.equal?(old_widget_fact_model) &&
        Widget.fact_model.equal?(WidgetFactModel)
    }
    print results.map { |k, v| "\#{k}=\#{v}" }.join("\\n")
  RUBY

  def test_fact_models_are_looked_up_again_after_a_reload
    Dir.mktmpdir do |root|
      write(root, 'app/models/post.rb', "class Post < ActiveRecord::Base; end\n")
      write(root, 'app/fact_models/widget_fact_model.rb', "class WidgetFactModel < ActiveReporting::FactModel; end\n")
      write(root, 'reloading_app.rb', APP)
      # Use the same database as the rest of the suite so only the adapter under test is needed
      db_config = ActiveRecord::Base.connection_db_config.configuration_hash.transform_keys(&:to_s)
      write(root, 'config/database.yml', { 'development' => db_config }.to_yaml)

      output = IO.popen([RbConfig.ruby, '-Ilib', File.join(root, 'reloading_app.rb'), root], err: %i[child out], &:read)
      results = output.lines.grep(/=(true|false)$/).to_h { |line| line.chomp.split('=') }

      assert_equal 'true', results['post_was_reloaded'], "app did not reload as expected:\n#{output}"
      assert_equal 'true', results['generated_fact_model_uses_new_post'],
                   'generated fact model still points to the Post class from before the reload'
      assert_equal 'true', results['generated_fact_model_was_replaced']
      assert_equal 'true', results['widget_uses_new_fact_model'],
                   'Widget.fact_model still returns the WidgetFactModel from before the reload'
    end
  end

  private

  def write(root, path, content)
    path = File.join(root, path)
    FileUtils.mkdir_p(File.dirname(path))
    File.write(path, content)
  end
end
