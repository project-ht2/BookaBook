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
  before_action :book_item_owner, only: [:edit, :update, :destroy]

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
    if book_item_params[:quantity].to_i > 0 
      @book = Book.find(book_item_params[:book_id]) if !book_item_params[:book_id].blank?
      if @book.blank?  
        @book = Book.find_or_create_by(goodreads_id: book_item_params[:goodreads_id])
        @book.update_goodreads_info
      end
      # Check if this book_item already in this shelf
      @book_item = BookItem.find_or_create_by(shelf_id: book_item_params[:shelf_id], book_id: @book.id)
      @book_item.quantity = book_item_params[:quantity]
      
      if @book_item.save!
        flash[:success] = "You got a book."
      else
        flash[:error] = "Something wrong."
        flash[:error] = @book_item.errors.full_messages.to_sentence
      end
    else 
      book_id = (book_item_params[:book_id] || Book.find_by(goodreads_id: book_item_params[:goodreads_id].to_i).presence.try(:id))
      @book_items = BookItem.where("shelf_id = ? AND book_id = ?", book_item_params[:shelf_id], book_id) if book_id.present?
      if @book_items.present?
        @book_items.destroy_all 
        flash[:warning] = "Book removed."
      else
        flash[:warning] = "Mission impossible."
      end
    end
    redirect_to :back
  end
    
  # DELETE /book_items/1
  # DELETE /book_items/1.json
  def destroy
    @book_item.destroy
    redirect_to :back
  end
  
  def book_item_owner
    unless current_user.id ==  @book_item.shelf.user_id
      flash[:notice] = 'Access denied as you are not the owner of this Book Item'
      redirect_to :back
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_book_item
    @book_item = BookItem.find(params[:id])
  end
  
  def book_item_params
    params.require(:book_item).permit(:book_id, :shelf_id, :quantity, :goodreads_id)
  end
end
