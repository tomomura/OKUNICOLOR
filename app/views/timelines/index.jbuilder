json.timelines do
  json.colors @colors
  json.tweets do
    json.array! @timelines do |timeline|
      json.text timeline.text
      coordinates = timeline.geo.try(:coordinates).to_a
      json.latitude coordinates.first
      json.longitude coordinates.last
    end
  end
end
