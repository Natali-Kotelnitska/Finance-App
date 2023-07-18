class Operation < ApplicationRecord
  belongs_to :category
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, :odate, presence: true
  validates :category_id, presence: true
  validates :otype, presence: true
end
