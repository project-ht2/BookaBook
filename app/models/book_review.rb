=begin
create_table "book_reviews", force: :cascade do |t|
  t.integer  "user_id"
  t.integer  "book_id"
  t.integer  "rating"
  t.text     "content"
  t.datetime "created_at", null: false
t.datetime "updated_at", null: false
end
=end

class BookReview < ApplicationRecord
  belongs_to :book
  belongs_to :user
end
