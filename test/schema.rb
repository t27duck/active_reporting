ActiveRecord::Schema.define do
  self.verbose = false

  create_table :platforms, force: true do |t|
    t.string :name, null: false
    t.string :kind, null: false
  end
  add_index :platforms, [:name, :kind], unique: true

  create_table :locations, force: true do |t|
    t.string :name, null: false
  end
  add_index :locations, :name, unique: true

  create_table :series, force: true do |t|
    t.string :name, null: false
  end
  add_index :series, :name, unique: true

  create_table :games, force: true do |t|
    t.string :title, null: false
    t.integer :platform_id, null: false
    t.integer :genre_id, null: false
  end
  add_index :games, :platform_id
  add_index :games, :genre_id

  create_table :genres, force: true do |t|
    t.string :display_name, null: false
  end

  create_table :figures, force: true do |t|
    t.integer :series_id, null: false
    t.string :name, null: false
    t.string :kind, null: false
  end
  add_index :figures, :series_id

  create_table :release_dates, force: true do |t|
    t.integer :amiibo_id, null: false
    t.integer :location_id, null: false
    t.integer :released_on_id, null: false
  end
  add_index :release_dates, :amiibo_id
  add_index :release_dates, :location_id
  add_index :release_dates, :released_on_id

  create_table :game_compatabilities, force: true do |t|
    t.integer :amiibo_id, null: false
    t.integer :game_id, null: false
  end
  add_index :game_compatabilities, :amiibo_id
  add_index :game_compatabilities, :game_id

  create_table :date_dimensions, id: false, force: true do |t|
    t.integer :id,          null: false # YYYYMMDD
    t.integer :year,        null: false # 1 - 12
    t.integer :quarter,     null: false # 1 - 4
    t.integer :month,       null: false # 1 - 12
    t.integer :day,         null: false # 1 - 31
    t.date    :date,        null: false # Date object
  end

  create_table :users, force: true do |t|
    t.string :username
    t.timestamps null: false
  end

  create_table :profiles, force: true do |t|
    t.integer :user_id, null: false
    t.string :favorite_pokemon, null: false
    t.timestamps null: false
  end

  create_table :sales, force: true do |t|
    t.string :item, null: false
    t.decimal :base_price, null: false, default: 0
    t.decimal :taxes, null: false, default: 0
    t.decimal :total, null: false, default: 0
    t.integer :placed_at_id, null: false
    t.timestamps null: false
  end
end
