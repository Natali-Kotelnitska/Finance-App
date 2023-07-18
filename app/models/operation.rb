class Operation < ApplicationRecord
  belongs_to :category
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, :odate, :otype presence: true
  validates :category_id, presence: true
end
