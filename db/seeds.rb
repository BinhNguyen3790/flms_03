User.create!(
  name: "Nguyen Van Binh",
  email: "example@railstutorial.org",
  phone: "0333985817",
  address: "184 Nguyen Dinh Tuu",
  password: "123123",
  password_confirmation: "123123",
  admin: true)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  User.create!(
    name: name,
    email: email,
    phone: "0333985817",
    address: "184 Nguyen Dinh Tuu",
    password: "123123",
    password_confirmation: "123123")
end

12.times do |n|
  name  = "Author-#{n+1}"
  profile = Faker::Lorem.sentence(10)
  Author.create!(
    name: name,
    profile: profile,
    avatar: "bookstack.png")
end

12.times do |n|
  name  = "Publisher-#{n+1}"
  Publisher.create!(
    name: name)
end

name= ["Detective", "Textbooks", "Literature", "Novel", "Romance", "Skill",
  "Business", "Marketing", "Horrow", "Comics", "Computers & Tech", "Arts & Music"]
for i in 0..11 do
  Category.create!(
    name: name[i],
    image: "categories.jpg"
  )
end
12.times do
  12.times do |n|
    name  = Faker::Name.name
    content = Faker::Lorem.sentence(10)
    number_of_pages = n+200
    quantity = n+100
    Book.create!(
      name: name,
      content: content,
      year: "2019-12-09",
      number_of_pages: number_of_pages,
      image: "book.jpg",
      quantity: quantity,
      author_id: n+1,
      publisher_id: n+1,
      category_id: n+1)
  end
end

5.times do |n|
  content = Faker::Lorem.sentence(10)
  Comment.create!(
    book_id: 1,
    user_id: 1,
    content: content)
end

5.times do |n|
  Rating.create!(
    book_id: 1,
    user_id: 1,
    rate: 5)
end

5.times do |n|
  Like.create!(
    book_id: 1,
    user_id: 1)
end

5.times do |n|
  Follow.create!(
    author_id: 1,
    user_id: 1)
end
