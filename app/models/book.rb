  # create_table "books", force: :cascade do |t|
  #   t.string   "title"
  #   t.integer  "author_id"
  #   t.integer  "category_id"
  #   t.decimal  "isbn",        precision: 13
  #   t.text     "description"
  #   t.datetime "created_at",                 null: false
  #   t.datetime "updated_at",                 null: false
  #   t.string   "image_url"
  #   t.index ["author_id"], name: "index_books_on_author_id", using: :btree
  #   t.index ["category_id"], name: "index_books_on_category_id", using: :btree
  # end

class Book < ApplicationRecord
    belongs_to :author
    belongs_to :category
  
    validates :title, presence: true
    validates :isbn, uniqueness: true, :allow_blank => true, :allow_nil => true

end
