class IdeasController < ApplicationController
  load_and_authorize_resource
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  add_crumb("Ideas") { |instance| instance.send :ideas_path }

  # GET /ideas
  def index
    @ideas = Idea.paginate(page: params[:page])
  end

  # GET /ideas/1
  def show
    add_crumb @idea.title
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
    add_crumb "Add a New Idea"
  end

  # GET /ideas/1/edit
  def edit
    add_crumb @idea.title
  end

  # POST /ideas
  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      redirect_to @idea, flash: { success: 'The idea was successfully created.' }
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /ideas/1
  def update
    if @idea.update(idea_params)
      redirect_to @idea, flash: { success: 'The idea was successfully updated.' }
    else
      render action: 'edit'
    end
  end

  # DELETE /ideas/1
  def destroy
    @idea.destroy
    redirect_to ideas_url, flash: { success: 'The idea was successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:user_id, :title, :description, :published)
    end
end