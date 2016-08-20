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
  has_many :book_reviews

  validates :title, presence: true
  validates :isbn, uniqueness: true, :allow_blank => true, :allow_nil => true
    
  after_create do
    self.title_downcase = self.title.mb_chars.downcase.to_s
    self.save!
  end
  
  def update_goodreads_info
    if self.goodreads_id?
      book_gr = Goodreads.new.book(self.goodreads_id)
      # Author trick
      if book_gr.authors.author.class == Array
        author_name = book_gr.authors.author[0].name
      else
        author_name = book_gr.authors.author.name
      end
      # Assign data
      self.update(
        title: book_gr.title, 
        description: book_gr.description,
        isbn: book_gr.isbn13,
        author_id: Author.find_or_create_by(name: author_name).id,
        image_url: book_gr.image_url.sub("m/#{goodreads_id}", "l/#{goodreads_id}").sub("http:","https:"),
        category_id: Category.first.id
      )
    end
    self
  end
end
