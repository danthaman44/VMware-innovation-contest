
class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  add_crumb("Comments") { |instance| instance.send :comments_path }
  # GET /comments
  def index
  	@comments = Comment.paginate(:page => params[:page])
  end

  # GET /comments/1
  def show
  	add_crumb @comment.body, @comments
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    add_crumb  "New Comment", @comments
  end

  # GET /comments/1/edit
  def edit
  	add_crumb @comment.body, @comments
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment, notice: 'Comment was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :user_id, :idea_id, :published)
    end
end