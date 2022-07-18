class Spend < ApplicationRecord

  scope :filter_by_amount, -> (order){ order(amount: order) }
  scope :filter_by_category, -> (category){ where(category: category) }

  enum :category, [:traveling, :clothing, :taxi, :cafes, :shops, :other]
  validates :title, presence: true
  validates :amount, presence: true
  belongs_to :user

  filterrific(
    default_filter_params: { filter_by_amount: 'desc' },
    available_filters:[
    :filter_by_amount,
    :filter_by_category
  ])
end
