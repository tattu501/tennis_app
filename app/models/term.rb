class Term < ApplicationRecord
  has_one_attached :image
  default_scope { order(term: :asc) }
  validates :term,  presence: true, uniqueness: true, length: { minimum: 1 }
  validates :explanation, presence: true, length: { minimum: 10 }
end
