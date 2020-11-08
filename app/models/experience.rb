class Experience < ApplicationRecord
  has_one_attached :image
  default_scope { order(year: :desc, month: :desc) }
  validates :date, presence: true, uniqueness: true
  validates :explanation, presence: true, length: { minimum: 50 }
end
