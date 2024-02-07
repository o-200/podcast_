class Podcast < ApplicationRecord
  has_one_attached :audio

  validates :name, presence: true, uniqueness: true
end
