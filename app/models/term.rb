class Term < ApplicationRecord
  has_one_attached :image
  default_scope { order(term: :asc) }
  validates :term,  presence: true, uniqueness: true
  validates :explanation, presence: true
end
