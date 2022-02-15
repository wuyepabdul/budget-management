class CategoryTransaction < ApplicationRecord
  belongs_to :category
  belongs_to :user_transaction
end
