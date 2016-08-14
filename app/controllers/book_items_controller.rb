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
    byebug 
    @book_item.shelf_id = Shelf.find(params[:shelf_id]).id
    @book_item.book_id =

    respond_to do |format|
      if @book_item.save
        format.html { redirect_to @book_item, notice: 'Book item was successfully created.' }
        format.json { render :show, status: :created, location: @book_item }
      else
        format.html { render :new }
        format.json { render json: @book_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_items/1
  # PATCH/PUT /book_items/1.json
  def update
    respond_to do |format|
      if @book_item.update(book_item_params)
        format.html { redirect_to @book_item, notice: 'Book item was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_item }
      else
        format.html { render :edit }
        format.json { render json: @book_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_items/1
  # DELETE /book_items/1.json
  def destroy
    @book_item.destroy
    respond_to do |format|
      format.html { redirect_to book_items_url, notice: 'Book item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_item
      @book_item = BookItem.find(params[:id])
    end
end
