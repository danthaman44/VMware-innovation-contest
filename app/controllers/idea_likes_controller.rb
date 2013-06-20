class IdeaLikesController < ApplicationController
  load_and_authorize_resource
  before_action :set_idea_like, only: [:show, :edit, :update, :destroy]
  add_crumb("Idea Likes") { |instance| instance.send :idea_likes_path }

  # GET /idea_likes
  def index
    @idea_likes = IdeaLike.paginate(page: params[:page])
  end

  # GET /idea_likes/1
  def show
    add_crumb @idea_like.user_id
  end

  # GET /idea_likes/new
  def new
    @idea_like = IdeaLike.new
    add_crumb "Add a New Idea Like"
  end

  # GET /idea_likes/1/edit
  def edit
    add_crumb @idea_like.user_id
  end

  # POST /idea_likes
  def create
    @idea_like = IdeaLike.new(idea_like_params)

    if @idea_like.save
      redirect_to @idea_like, flash: { success: 'The idea like was successfully created.' }
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /idea_likes/1
  def update
    if @idea_like.update(idea_like_params)
      redirect_to @idea_like, flash: { success: 'The idea like was successfully updated.' }
    else
      render action: 'edit'
    end
  end

  # DELETE /idea_likes/1
  def destroy
    @idea_like.destroy
    redirect_to idea_likes_url, flash: { success: 'The idea like was successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea_like
      @idea_like = IdeaLike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_like_params
      params.require(:idea_like).permit(:user_id, :idea_id)
    end
end