class BooksController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create] 
    
    def index
        @books = Book.all
    end
    
    def new
        @book = Book.new 
    end 
    
    def create
        
        @book = Book.new(book_params)
        @book.author_id = Author.find_or_create_by(name: book_params[:author_id]).id

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
        
        @book.author_id = Author.find_or_create_by(name: book_params[:author_id]).id
        @book.category_id = book_params[:category_id]
        @book.title = book_params[:title]
        @book.isbn = book_params[:isbn]
        @book.description = book_params[:description]
        @book.image_url = book_params[:image_url]
        
        if @book.save
            flash[:success] = "Một sách đã cập nhật."
            redirect_to books_path
        else
            flash[:error] = "Oh, không cập nhật được sách"
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
        # Search from our local database
        @query = params[:q].downcase
        @books = Book.where(['lower(title) LIKE ?', "%#{@query}%"])
        
        # Search from Goodreads database
        client = Goodreads.new
        @books_from_goodreads = client.search_books(@query)
    end
    
    private 
        def book_params
            params.require(:book).permit(:title, :author_id, :description, :isbn, :category_id, :image_url)
        end 

end
