
class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]
  add_crumb("Attachments") { |instance| instance.send :attachments_path }
  # GET /attachments
  def index
  	@attachments = Attachment.paginate(:page => params[:page])
  end

  # GET /attachments/1
  def show
  	add_crumb @attachment.file_name, @attachments
  end

  # GET /attachments/new
  def new
    @attachment = Attachment.new
    add_crumb  "New Attachment", @attachments
  end

  # GET /attachments/1/edit
  def edit
  	add_crumb @attachment.file_name, @attachments
  end

  # POST /attachments
  def create
    @attachment = Attachment.new(attachment_params)

    if @attachment.save
      redirect_to @attachment, notice: 'Attachment was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /attachments/1
  def update
    if @attachment.update(attachment_params)
      redirect_to @attachment, notice: 'Attachment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /attachments/1
  def destroy
    @attachment.destroy
    redirect_to attachments_url, notice: 'Attachment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
      params.require(:attachment).permit(:file_name, :location, :file_size, :idea_id, :published)
    end
end