class PagesController < ApplicationController
  load_and_authorize_resource
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  add_crumb("Pages") { |instance| instance.send :pages_path }

  # GET /pages
  def index
    @pages = Page.paginate(page: params[:page])
  end

  # GET /pages/1
  def show
    add_crumb @page.title
  end

  # GET /pages/new
  def new
    @page = Page.new
    add_crumb "Add a New Page"
  end

  # GET /pages/1/edit
  def edit
    add_crumb @page.title
  end

  # POST /pages
  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to @page, flash: { success: 'The page was successfully created.' }
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      redirect_to @page, flash: { success: 'The page was successfully updated.' }
    else
      render action: 'edit'
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    redirect_to pages_url, flash: { success: 'The page was successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:user_id, :title, :content, :sort_order, :published)
    end
end