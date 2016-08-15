class Book < ApplicationRecord
    belongs_to :author
    belongs_to :category
    has_many :book_items
    
    validates :title, presence: true
    validates :isbn, uniqueness: true, :allow_blank => true, :allow_nil => true

    def image_url_or_default
        if image_url.blank? 
          "book_image/book_cover.jpg"
        else 
          image_url
        end
    end
end
