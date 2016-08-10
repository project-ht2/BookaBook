class Book < ApplicationRecord
    belongs_to :author
    belongs_to :category
  
    validates :title, presence: true
    validates :isbn, uniqueness: true

    def image_url_or_default
        if image_url != nil 
          return image_url 
        else 
          return "http://loremflickr.com/128/193/#{title}"
        end
    end
end
