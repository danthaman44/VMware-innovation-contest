class IdeaFilesController < ApplicationController
  load_and_authorize_resource
  before_action :set_idea_file, only: [:show, :edit, :update, :destroy]
  add_crumb("Idea Files") { |instance| instance.send :idea_files_path }

  # GET /idea_files
  def index
    @idea_files = IdeaFile.paginate(page: params[:page])
  end

  # GET /idea_files/1
  def show
    add_crumb @idea_file.idea_id
  end

  # GET /idea_files/new
  def new
    @idea_file = IdeaFile.new
    add_crumb "Add a New Idea File"
  end

  # GET /idea_files/1/edit
  def edit
    add_crumb @idea_file.idea_id
  end

  # POST /idea_files
  def create
    @idea_file = IdeaFile.new(idea_file_params)

    if @idea_file.save
      redirect_to @idea_file, flash: { success: 'The idea file was successfully created.' }
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /idea_files/1
  def update
    if @idea_file.update(idea_file_params)
      redirect_to @idea_file, flash: { success: 'The idea file was successfully updated.' }
    else
      render action: 'edit'
    end
  end

  # DELETE /idea_files/1
  def destroy
    @idea_file.destroy
    redirect_to idea_files_url, flash: { success: 'The idea file was successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea_file
      @idea_file = IdeaFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_file_params
      params.require(:idea_file).permit(:idea_id, :file, :published)
    end
end