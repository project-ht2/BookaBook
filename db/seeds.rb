# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create Categories
['Politics', 'Science', 'Business', 'Academic', 'Children book', 'Fiction', 'Others'].each do |c|
  Category.create(name: c)
end

author_list = [
    ["Yann Martel", "Male", DateTime.new(1963, 6, 25), "Yann Martel is the author of Life of Pi, the #1 international bestseller and winner of the 2002 Man Booker (among many other prizes). He is also the award-winning author of The Facts Behind the Helsinki Roccamatios (winner of the Journey Prize), Self, Beatrice & Virgil, and 101 Letters to a Prime Minister. Born in Spain in 1963, Martel studied philosophy at Trent University, worked at odd jobs—tree planter, dishwasher, security guard—and traveled widely before turning to writing. He lives in Saskatoon, Canada, with the writer Alice Kuipers and their four children.", "https://d2arxad8u2l0g7.cloudfront.net/authors/1454012903p5/811.jpg"],
    ["Antoine de Saint-Exupéry", "Male", DateTime.new(1900, 6, 29), "Antoine de Saint-Exupéry was born in Lyons on June 29, 1900. He flew for the first time at the age of twelve, at the Ambérieu airfield, and it was then that he became determined to be a pilot. He kept that ambition even after moving to a school in Switzerland and while spending summer vacations at the family's château at Saint-Maurice-de-Rémens, in eastern France. (The house at Saint-Maurice appears again and again in Saint-Exupéry's writing.)

Later, in Paris, he failed the entrance exams for the French naval academy and, instead, enrolled at the prestigious art school l'Ecole des Beaux-Arts. In 1921 Saint-Exupéry began serving in the military, and was stationed in Strasbourg. There he learned to be a pilot, and his career path was forever settled. ", "https://d2arxad8u2l0g7.cloudfront.net/authors/1330853515p5/1020792.jpg"]
]

author_list.each do |name, gender, birthday, description, image_url|
  Author.create(name: name, gender: gender, birthday: birthday, description: description, image_url: image_url)
end


book_list = [
    ["Life of Pi", Author.first.id, Category.where(name: 'Truyện').first, 770430074, "Life of Pi is a fantasy adventure novel by Yann Martel published in 2001. The protagonist, Piscine Molitor \"Pi\" Patel, a Tamil boy from Pondicherry, explores issues of spirituality and practicality from an early age. He survives 227 days after a shipwreck while stranded on a boat in the Pacific Ocean with a Bengal tiger named Richard Parker.", "https://d.gr-assets.com/books/1320562005l/4214.jpg", 4214],
    ["The Little Prince", Author.last.id, Category.where(name: 'Sách thiếu nhi').first, 156012197, "Moral allegory and spiritual autobiography, The Little Prince is the most translated book in the French language. With a timeless charm it tells the story of a little boy who leaves the safety of his own tiny planet to travel the universe, learning the vagaries of adult behaviour through a series of extraordinary encounters. His personal odyssey culminates in a voyage to Earth and further adventures.", "https://d.gr-assets.com/books/1367545443l/157993.jpg", 157993]
]

book_list.each do |title, author_id, category, isbn, description, image_url, goodreads_id|
  Book.create(title:title, author_id:author_id, category:category, isbn:isbn, description:description, image_url:image_url, goodreads_id:goodreads_id)
end

# Seed data for Transaction Status
# 1 Đang yêu cầu
# 2 Đồng ý
# 3 Đã nhận sách
# 4 Trả sách
# 5 Đã trả sách
# 6 Huỷ
TransactionStatus.delete_all
TransactionStatus.create! id: 1, name: "Requesting"
TransactionStatus.create! id: 2, name: "Accepted"
TransactionStatus.create! id: 3, name: "Received"
TransactionStatus.create! id: 4, name: "Sending back"
TransactionStatus.create! id: 5, name: "Returned"
TransactionStatus.create! id: 6, name: "Cancel"

UserCategory.create!([
                         {name: "Developer", description: "Web developer category"},
                         {name: "Designer", description: "Designer class"}
                     ])

UserGroup.create!([
                      {name: "html", description: "Group for learning HTML"},
                      {name: "Ruby fundamentals", description: "All about Ruby language"}
                  ])

CategoryGroup.create!([
                          {category_id: UserCategory.where(name: 'developer').id, group_id: UserGroup.where(name: 'html').id},
                          {category_id: UserCategory.where(name: 'developer').id, group_id: UserGroup.where(name: 'Ruby fundamentals').id}
                      ])