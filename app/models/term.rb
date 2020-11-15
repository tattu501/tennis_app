class Term < ApplicationRecord
  has_one_attached :image
  default_scope { order(term: :asc) }
  validates :term,  presence: true, uniqueness: true
  validates :explanation, presence: true
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message: "should be less than 5MB" }

  # 表示用のリサイズ済み画像を返す
  def display_image
    image.variant(resize_to_limit: [600, 300])
  end
end
