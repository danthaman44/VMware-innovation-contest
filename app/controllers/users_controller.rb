class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  add_crumb("Users") { |instance| instance.send :users_path }

  # GET /users
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  def show
    add_crumb @user.name
  end

  # GET /users/new
  def new
    @user = User.new
    add_crumb "Add a New User"
  end

  # GET /users/1/edit
  def edit
    add_crumb @user.name
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, flash: { success: 'The user was successfully created.' }
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, flash: { success: 'The user was successfully updated.' }
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, flash: { success: 'The user was successfully deleted.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      if can? :manage, :all
        params.require(:user).permit(:name, :email, :password, :job_title, :phone, :technical_expertise, :email_idea_comments, :email_news, :is_admin)
      else
        params.require(:user).permit(:name, :email, :password, :job_title, :phone, :technical_expertise, :email_idea_comments, :email_news)
      end
    end
end