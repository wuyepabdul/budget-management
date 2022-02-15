class UserTransaction < ApplicationRecord
    belongs_to :user
    has_many :category_transactions
    has_many :categories, through: :category_transactions

    validates :name, presence: true
    validates :amount, presence: true
end