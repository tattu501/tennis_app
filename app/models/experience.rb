class Experience < ApplicationRecord
  has_one_attached :image
  default_scope { order(date: :desc) }
  validates :date, presence: true, uniqueness: true
  validates :explanation, presence: true
end
