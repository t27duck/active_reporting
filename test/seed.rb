group_admins = Group.create!(name: 'Admins')
group_users  = Group.create!(name: 'Users')

admins = []
(1..3).each do |x|
  admins << User.create!(
    username: "admin_#{x}",
    group: group_admins
  )
end

(1..5).each do |x|
  user = User.create!(
    username: Faker::Internet.unique.user_name,
    group: group_users
  )
end

Post.create!(
  title: Faker::Lorem.words.join(' '),
  body: Faker::Lorem.paragraph,
  state: 'draft',
  user: User.find_by!(username: 'admin_1')
)

(1..20).each do |x|
  post = Post.create!(
    title: Faker::Lorem.words.join(' '),
    body: Faker::Lorem.paragraph,
    state: 'publish',
    user: admins.sample
  )

  rand(10).times.each do
    post.comments.create!(
      user: User.offset(rand(User.count)).first,
      body: Faker::Lorem.paragraph
    )
  end
end
