class Game < ApplicationRecord

  has_many :reviews, dependent: :destroy

  attachment :image

  validates :name, presence:true
  validates :name, uniqueness:true
  validates :min_player, presence:true
  validates :max_player, presence:true
  validates :image_id, presence:true

end
