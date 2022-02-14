class UserTransaction < ApplicationRecord
    belongs_to :user
    validates :name, :amount, :categories, presence: true
end