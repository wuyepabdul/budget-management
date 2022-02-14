class UserTransaction < ApplicationRecord
    belongs_to :user
    has_many :categories, through: :user
    validates :name, :amount, :categories, presence: true
end