class Review < ApplicationRecord

  belongs_to :user
  belongs_to :game

  validates :recommend,  presence: true
  validates :strategy,   presence: true
  validates :luck,       presence: true
  validates :memory,     presence: true
  validates :talk,       presence: true
  validates :quick,      presence: true
  validates :psychology, presence: true
  validates :imagination, presence: true
  validates :play_time,  presence: true

end
