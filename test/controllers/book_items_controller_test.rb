require 'test_helper'

class BookItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_item = book_items(:one)
  end

  test "should get index" do
    get book_items_url
    assert_response :success
  end

  test "should get new" do
    get new_book_item_url
    assert_response :success
  end

  test "should create book_item" do
    assert_difference('BookItem.count') do
      post book_items_url, params: { book_item: { available_count: @book_item.available_count, book: @book_item.book, quantity: @book_item.quantity, shelf: @book_item.shelf } }
    end

    assert_redirected_to book_item_url(BookItem.last)
  end

  test "should show book_item" do
    get book_item_url(@book_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_item_url(@book_item)
    assert_response :success
  end

  test "should update book_item" do
    patch book_item_url(@book_item), params: { book_item: { available_count: @book_item.available_count, book: @book_item.book, quantity: @book_item.quantity, shelf: @book_item.shelf } }
    assert_redirected_to book_item_url(@book_item)
  end

  test "should destroy book_item" do
    assert_difference('BookItem.count', -1) do
      delete book_item_url(@book_item)
    end

    assert_redirected_to book_items_url
  end
end
