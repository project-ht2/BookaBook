# create_table "book_items", force: :cascade do |t|
#   t.integer  "shelf_id"
#   t.integer  "book_id"
#   t.integer  "quantity"
#   t.integer  "available_count"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
#   t.index ["book_id"], name: "index_book_items_on_book_id", using: :btree
#   t.index ["shelf_id"], name: "index_book_items_on_shelf_id", using: :btree
# end

# create_table "books", force: :cascade do |t|
#   t.string   "title"
#   t.integer  "author_id"
#   t.integer  "category_id"
#   t.decimal  "isbn",           precision: 13
#   t.text     "description"
#   t.datetime "created_at",                    null: false
#   t.datetime "updated_at",                    null: false
#   t.string   "image_url"
#   t.integer  "goodreads_id"
#   t.string   "title_downcase"
#   t.index ["author_id"], name: "index_books_on_author_id", using: :btree
#   t.index ["category_id"], name: "index_books_on_category_id", using: :btree
# end

class BookItemsController < ApplicationController
  before_action :set_book_item, only: [:show, :edit, :update, :destroy]

  # GET /book_items
  # GET /book_items.json
  def index
    @book_items = BookItem.all
  end

  # GET /book_items/1
  # GET /book_items/1.json
  def show
  end

  # GET /book_items/new
  def new
    @book_item = BookItem.new
  end

  # GET /book_items/1/edit
  def edit
  end

  # POST /book_items
  # POST /book_items.json
  def create
    if book_item_params[:book_id].nil?
      
      if @book = Book.find_by(goodreads_id: book_item_params[:goodreads_id]) # check if this book is in the database yet
      elsif @book = save_goodreads_book(book_item_params[:goodreads_id]) # Not found in database, create new book from Goodreads.
      else
        # This book is already in the database or error during adding book
        flash[:error] = "Cannot save this book to database"
        redirect_to :back
      end
    else
      @book = Book.find(book_item_params[:book_id])
    end
      # Check if this book_item already in this shelf
      shelf = Shelf.find(book_item_params[:shelf_id])
      @book_item = shelf.book_items.new
      @book_item.book_id = @book.id 
      @book_item.quantity = book_item_params[:quantity]
    
    if shelf.save!
      flash[:success] = "Book item was successfully created."
      redirect_to user_path(current_user)
    else
      flash[:error] = "Cannot add book to Bookshelf"
      flash[:error] = shelf.errors.full_messages.to_sentence
      redirect_to user_path(current_user)
    end
  end
    
  # DELETE /book_items/1
  # DELETE /book_items/1.json
  def destroy
    @book_item.destroy
    redirect_to user_path(current_user)
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_book_item
    @book_item = BookItem.find(params[:id])
  end
  
  def book_item_params
    params.require(:book_item).permit(:book_id, :shelf_id, :quantity, :goodreads_id)
  end
  
  def save_goodreads_book(goodreads_id)
    book_gr = Goodreads.new.book(goodreads_id)
    if book_gr.authors.author.class == Array
      author_name = book_gr.authors.author[0].name
    else
      author_name = book_gr.authors.author.name
    end
    
    # Assign data
    book = Book.create(
      title: book_gr.title, 
      description: book_gr.description,
      isbn: book_gr.isbn13,
      author_id: Author.find_or_create_by(name: author_name).id,
      image_url: book_gr.image_url.sub("m/#{goodreads_id}", "l/#{goodreads_id}"),
      goodreads_id: book_gr.id, 
      category_id: Category.first.id
    )
    
    if book.save!
      return book
    else
      flash[:error] = book.errors.full_messages.to_sentence
      return false
    end
  end
end
