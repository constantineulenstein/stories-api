class Api::V1::StoriesController < Api::V1::BaseController
skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @stories = Story.order(created_at: :desc)
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      render :show, status: :created
    else
      render_errors
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
       render :show, status: :updated
    else
      render_errors
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    head :no_content
  end

  private

  def render_errors
    render json: {errors: @story.errors.full_messages}
  end

  def story_params
    params.require(:story).permit(:name, :text)
  end
end
