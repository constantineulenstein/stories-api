json.stories do
  json.array! @stories do |story|
    json.extract! story, :id, :name, :text
  end
end

# json.extract! @stories[0], :id, :name, :text
