class UserTransaction < ApplicationRecord
    belongs_to :user
    has_many :category_transactions, dependent: :destroy
    has_many :categories, through: :category_transactions

    validates :name, presence: true
    validates :amount, presence: true
end