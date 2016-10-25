class Episode < ApplicationRecord
  belongs_to :season, foreign_key: 'content_id'

  validates :season, presence: true
end
