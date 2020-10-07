class Experience < ApplicationRecord
  has_one_attached :image
  default_scope { order(year: :desc, month: :desc) }
  validates :year,  presence: true, length: { minimum: 1 }
  validates :month, presence: true, length: { in: 1..2 }
end
