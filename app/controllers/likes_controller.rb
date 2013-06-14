
class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]
  add_crumb("Likes") { |instance| instance.send :likes_path }
  # GET /likes
  def index
  	@likes = Like.paginate(:page => params[:page])
  end

  # GET /likes/1
  def show
  	add_crumb @like.user_id, @likes
  end

  # GET /likes/new
  def new
    @like = Like.new
    add_crumb  "New Like", @likes
  end

  # GET /likes/1/edit
  def edit
  	add_crumb @like.user_id, @likes
  end

  # POST /likes
  def create
    @like = Like.new(like_params)

    if @like.save
      redirect_to @like, notice: 'Like was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /likes/1
  def update
    if @like.update(like_params)
      redirect_to @like, notice: 'Like was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /likes/1
  def destroy
    @like.destroy
    redirect_to likes_url, notice: 'Like was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:user_id, :idea_id)
    end
end