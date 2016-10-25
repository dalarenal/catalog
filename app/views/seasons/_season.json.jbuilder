json.(season, :id, :title, :plot)
json.episodes do
  json.array! season.episodes.order(:number) do |episode|
    json.(episode, :id, :title, :plot, :number)
  end
end
