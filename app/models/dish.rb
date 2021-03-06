class Dish < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 140 }
  validates :tips, length: { maximum: 50 }
  validate :picture_size

  def feed_comment(dish_id)
    Comment.where("dish_id = ?", dish_id)
  end

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, ":5MBより大きい画像はアップロードできません。")
      end
    end
end
