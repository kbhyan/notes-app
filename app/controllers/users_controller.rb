class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:new, :create]

  # GET /users/:id
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/:id/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to notes_path
    else
      render :new
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile was successfully updated'
    else
      render :edit
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    redirect_to new_user_path, notice: 'Account was successfully deleted'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user ||= @current_user || User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(:name, :email, :password)
    end
end
