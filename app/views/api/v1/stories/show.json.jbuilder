json.extract! @story, :id, :name, :text
json.comments do
  json.array! @story.comments do |comment|
    json.extract! comment, :id, :name, :content
    json.commented_at comment.created_at.strftime("%A, %d %b %Y %l:%M %p")
  end
end

