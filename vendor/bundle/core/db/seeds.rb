User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 'admin')

20.times do
  ActsAsTaggableOn::Tag.create(name: Faker::Lorem.word)
end

def title_rand
  Faker::Lorem.words(2).join(" ").capitalize
end

def body_rand(count=10)
  Faker::Lorem.paragraphs(count).join(" ")
end

def date_rand
  rand(Date.civil(2015, 1, 1)..Date.civil(2016, 1, 31))
end

def tags_rand
  ActsAsTaggableOn::Tag.find(rand(1..ActsAsTaggableOn::Tag.count))
end

def tags_gen
  tags = []
  rand(1..5).times do
    tag = tags_rand
    tags << tag unless tags.include? tag
  end
  tags
end

def comments_gen
  comments = []

  rand(1..5).times do
    comments << Comment.create!(
        body: body_rand(rand(2..3)),
        name: title_rand,
        email: Faker::Internet.email,
        state: Comment.state.values.sample
    )
  end

  comments
end

def posts_rand
  posts = []
  rand(1..5).times do
    posts << Post.create!(
        title: title_rand,
        body: body_rand,
        draft: [true, false].sample,
        published_at: date_rand,
        tags: tags_gen,
        comments: comments_gen
    )
  end

  posts
end

10.times do
  category = Category.create!(title: title_rand, posts: posts_rand)
  next if Category.count == 1
  parent_category = Category.find(rand(1..Category.count))
  next if category.id == parent_category.id
  category.parent = parent_category unless category.subtree_ids.include? parent_category.id
  category.save
end