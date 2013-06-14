
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  add_crumb("Posts") { |instance| instance.send :posts_path }
  # GET /posts
  def index
  	@posts = Post.paginate(:page => params[:page])
  end

  # GET /posts/1
  def show
  	add_crumb @post.name, @posts
  end

  # GET /posts/new
  def new
    @post = Post.new
    add_crumb  "New Post", @posts
  end

  # GET /posts/1/edit
  def edit
  	add_crumb @post.name, @posts
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :content, :published, :user_id)
    end
end