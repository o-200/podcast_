class Podcast < ApplicationRecord
  has_one_attached :audio

  validates :name, presence: true, uniqueness: true
  validates :audio, attached: true,
                    content_type: ['audio/mpeg', 'audio/mp4', 'audio/wav', 'audio/aac', 'audio/ogg', 'audio/webm', 'audio/3gpp'],
                    size: { less_than: 2.gigabytes },
                    limit: { max: 1 }
end
