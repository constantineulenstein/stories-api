class Api::V1::CommentsController < Api::V1::BaseController
skip_before_action :verify_authenticity_token, only: [:create]

def create
@story = Story.find(params[:story_id])
@comment = Comment.new(comment_params)
@comment.story_id = @story.id
if @comment.save
  redirect_to api_v1_story_path(@story.id)
else
  render_errors
end
end

private

  def render_errors
    render json: {errors: @comment.errors.full_messages}
  end

  def comment_params
    params.require(:comment).permit(:name, :content)
  end

end
