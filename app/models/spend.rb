class Spend < ApplicationRecord
  enum :category, [:traveling, :clothing, :taxi, :cafes, :shops, :other]
  validates :title, presence: true
  validates :amount, presence: true
  belongs_to :user
end
