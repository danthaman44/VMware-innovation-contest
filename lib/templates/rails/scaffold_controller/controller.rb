class <%= controller_class_name %>Controller < ApplicationController
  load_and_authorize_resource
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]
  add_crumb("<%= plural_table_name.titleize%>") { |instance| instance.send :<%= plural_table_name %>_path }

  # GET <%= route_url %>
  def index
    @<%= plural_table_name %> = <%= singular_table_name.camelize %>.paginate(page: params[:page])
  end

  # GET <%= route_url %>/1
  def show
<% if controller_class_name == "Comments" -%>
    add_crumb @<%= singular_table_name %>.content
<% elsif attributes.map(&:"name").include?("name") -%>
    add_crumb @<%= singular_table_name %>.name
<% elsif attributes.map(&:"name").include?("title") -%>
    add_crumb @<%= singular_table_name %>.title
<% else -%>
    add_crumb @<%= singular_table_name %>.<%= attributes.first.name %>
<% end -%>
  end

  # GET <%= route_url %>/new
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    add_crumb "Add a New <%= singular_table_name.titleize%>"
  end

  # GET <%= route_url %>/1/edit
  def edit
<% if controller_class_name == "Comments" -%>
    add_crumb @<%= singular_table_name %>.content
<% elsif attributes.map(&:"name").include?("name") -%>
    add_crumb @<%= singular_table_name %>.name
<% elsif attributes.map(&:"name").include?("title") -%>
    add_crumb @<%= singular_table_name %>.title
<% else -%>
    add_crumb @<%= singular_table_name %>.<%= attributes.first.name %>
<% end -%>
  end

  # POST <%= route_url %>
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>

    if @<%= orm_instance.save %>
      redirect_to @<%= singular_table_name %>, flash: { success: <%= "'The #{human_name.downcase} was successfully created.'" %> }
    else
      render action: 'new'
    end
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    if @<%= orm_instance.update("#{singular_table_name}_params") %>
      redirect_to @<%= singular_table_name %>, flash: { success: <%= "'The #{human_name.downcase} was successfully updated.'" %> }
    else
      render action: 'edit'
    end
  end

  # DELETE <%= route_url %>/1
  def destroy
    @<%= orm_instance.destroy %>
    redirect_to <%= index_helper %>_url, flash: { success: <%= "'The #{human_name.downcase} was successfully deleted.'" %> }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[<%= ":#{singular_table_name}" %>]
      <%- else -%>
      params.require(<%= ":#{singular_table_name}" %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end
end