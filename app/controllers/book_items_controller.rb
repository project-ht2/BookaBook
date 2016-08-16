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
    # Check if this book_item already in this shelf
    shelf = Shelf.find(book_item_params[:shelf_id])
    @book_item = shelf.book_items.new(book_item_params)
    
    if shelf.save!
      flash[:success] = "Book item was successfully created."
      redirect_to user_path(current_user)
    else
      flash[:error] = "Cannot add book to Bookshelf"
      redirect_to user_path(current_user)
    end
  end
  
  # create book_items from Goodreads
  def create_from_goodreads
    
    # byebug
    # Save book to Book Model
    @book = save_goodreads_book(book_item_params[:book_id])
    
    # Create book_items
    shelf = Shelf.find(book_item_params[:shelf_id])
    @book_item = shelf.book_items.new 
    @book_item.book_id = @book.id 
    @book_item.quantity = book_item_params[:quantity]
    
    if shelf.save!
      flash[:success] = "Book item was successfully created."
      redirect_to user_path(current_user)
    else
      flash[:error] = "Cannot add book to Bookshelf"
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
      params.require(:book_item).permit(:book_id, :shelf_id, :quantity)
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
        image_url: book_gr.image_url,
        goodreads_id: book_gr.id, 
        category_id: Category.first.id
      )
      
      if book.save!
        return book
      else
        return false
      end
    end
end
