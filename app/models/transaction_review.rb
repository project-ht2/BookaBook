class TransactionReview < ApplicationRecord
  belongs_to :reviewer, class_name: 'User'
  belongs_to :target, class_name: 'User'
end
