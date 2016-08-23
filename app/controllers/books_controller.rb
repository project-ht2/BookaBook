class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_wooden_background, only: [:index, :search, :show]
  before_action :set_small_book_block, only: [:index, :search]
  before_action :set_big_book_block, only: [:show, :show_goodreads] 
    
  def index
    @books = Book.all
  end
    
  def new
    @book = Book.new 
  end 
    
  def create
    @book = Book.new(book_params)
    @book.author_id = Author.find_or_create_by(name: book_params[:author_name]).id

    if @book.save
      flash[:success] = "Một sách mới đã được tạo."
      redirect_to books_path
    else
      flash[:error] = @book.errors.full_messages.to_sentence
      redirect_to :back 
    end 
  end 
    
  def edit
    @book = Book.find(params[:id])
  end
    
  def update
    @book = Book.find(params[:id])
    
    @book.author = Author.find_or_create_by(name: book_params[:author_name])
    @book.category_id = book_params[:category_id]
    @book.title = book_params[:title]
    @book.isbn = book_params[:isbn]
    @book.description = book_params[:description]
    @book.image_url = book_params[:image_url]
    
    if @book.save!
      flash[:success] = "Một sách đã cập nhật."
      redirect_to @book
    else
      flash[:error] = "Oh, không cập nhật được sách"
      flash[:error] = @book.errors.full_messages.to_sentence
      redirect_to :back 
    end 
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy 
    flash[:success] = "Một sách đã xoá."
    redirect_to books_path
  end 
    
  def search
    if params[:q].blank?
      @books = Book.all
    else
      author_ids = Author.where(["name_downcase ILIKE ?","%#{params[:q].mb_chars.downcase.to_s}%"]).map(&:id)
      @books = Book.where(["title_downcase ILIKE ? OR author_id IN (?)","%#{params[:q].mb_chars.downcase.to_s}%", author_ids])
      goodreads_search = Goodreads.new.search_books(params[:q])
      if goodreads_search.total_results.to_i == 1
        @books_from_goodreads = [goodreads_search.results.work.best_book]
      else
        @books_from_goodreads = goodreads_search.results.work.map(&:best_book)
      end
      @books_from_goodreads.reject! {|book| @books.map(&:goodreads_id).include? book.id}
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_reviews = @book.book_reviews
  end
 
  def show_goodreads
    @book = Book.find_by(goodreads_id: params[:goodreads_id])
    redirect_to @book unless @book.nil?
    @book =  Goodreads.new.book(params[:goodreads_id])
    @book.image_url = @book.image_url.sub("m/#{@book.id}", "l/#{@book.id}").sub("http:","https:")
  end

private 
  def book_params
    params.require(:book).permit(:title, :author_name, :description, :isbn, :category_id, :image_url)
  end
end
