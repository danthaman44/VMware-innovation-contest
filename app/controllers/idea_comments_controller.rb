class IdeaCommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_idea_comment, only: [:show, :edit, :update, :destroy]
  add_crumb("Idea Comments") { |instance| instance.send :idea_comments_path }

  # GET /idea_comments
  def index
    @idea_comments = IdeaComment.paginate(page: params[:page])
  end

  # GET /idea_comments/1
  def show
    add_crumb @idea_comment.user_id
  end

  # GET /idea_comments/new
  def new
    @idea_comment = IdeaComment.new
    add_crumb "Add a New Idea Comment"
  end

  # GET /idea_comments/1/edit
  def edit
    add_crumb @idea_comment.user_id
  end

  # POST /idea_comments
  def create
    @idea_comment = IdeaComment.new(idea_comment_params)

    if @idea_comment.save
      redirect_to @idea_comment, flash: { success: 'The idea comment was successfully created.' }
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /idea_comments/1
  def update
    if @idea_comment.update(idea_comment_params)
      redirect_to @idea_comment, flash: { success: 'The idea comment was successfully updated.' }
    else
      render action: 'edit'
    end
  end

  # DELETE /idea_comments/1
  def destroy
    @idea_comment.destroy
    redirect_to idea_comments_url, flash: { success: 'The idea comment was successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea_comment
      @idea_comment = IdeaComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_comment_params
      params.require(:idea_comment).permit(:user_id, :idea_id, :content, :published)
    end
end