# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create Categories
['Sách chính trị', 'Sách khoa học', 'Sách kinh doanh', 'Sách giáo dục', 'Sách thiếu nhi', 'Truyện', 'Thể loại khác'].each do |c|
  Category.create(name: c)
end