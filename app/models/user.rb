class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :spends

  def total_spends_value
    total_value = 0
    spends.each do |spend|
      total_value += spend.amount
    end
    total_value
  end
end
