class Category < ApplicationRecord
    validates :name, presence: true
    
    belongs_to :user
    has_many :category_transactions
    has_many :user_transactions, through: :category_transactions
    has_one_attached :icon
end
