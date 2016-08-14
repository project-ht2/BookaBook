json.extract! book_item, :id, :shelf, :book, :quantity, :available_count, :created_at, :updated_at
json.url book_item_url(book_item, format: :json)