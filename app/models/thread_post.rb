class ThreadPost < ApplicationRecord
  belongs_to :book_threads
  belongs_to :user
end
