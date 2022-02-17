class Category < ApplicationRecord
    validates :name, presence: true
    
    belongs_to :user
    has_many :category_transactions, dependent: :destroy
    has_many :user_transactions, through: :category_transactions, dependent: :destroy
    has_one_attached :icon

    def total_amount
        user_transactions.sum('amount')
    end
end
