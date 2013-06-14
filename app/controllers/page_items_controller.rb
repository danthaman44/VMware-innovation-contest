
class PageItemsController < ApplicationController
  before_action :set_page_item, only: [:show, :edit, :update, :destroy]
  add_crumb("Page Items") { |instance| instance.send :page_items_path }
  # GET /page_items
  def index
  	@page_items = Page Item.paginate(:page => params[:page])
  end

  # GET /page_items/1
  def show
  	add_crumb @page_item.order, @page_items
  end

  # GET /page_items/new
  def new
    @page_item = PageItem.new
    add_crumb  "New Page Item", @page_items
  end

  # GET /page_items/1/edit
  def edit
  	add_crumb @page_item.order, @page_items
  end

  # POST /page_items
  def create
    @page_item = PageItem.new(page_item_params)

    if @page_item.save
      redirect_to @page_item, notice: 'Page item was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /page_items/1
  def update
    if @page_item.update(page_item_params)
      redirect_to @page_item, notice: 'Page item was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /page_items/1
  def destroy
    @page_item.destroy
    redirect_to page_items_url, notice: 'Page item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_item
      @page_item = PageItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_item_params
      params.require(:page_item).permit(:order, :content, :published, :user_id)
    end
end