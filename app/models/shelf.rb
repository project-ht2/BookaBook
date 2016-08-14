# create_table "shelves", force: :cascade do |t|
#     t.string   "name"
#     t.text     "description"
#     t.integer  "user_id"
#     t.datetime "created_at",  null: false
#     t.datetime "updated_at",  null: false
#   end

class Shelf < ApplicationRecord
	belongs_to :user
	has_many :book_items
end
