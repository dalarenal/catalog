class Season < Content
  has_many :episodes, foreign_key: 'content_id'
end
