class SessionsController < ApplicationController
  skip_before_action :authorize

  # POST /login
  def new
  end

  # POST /sessions
  def create
    user = User.find_by(email: params[:email])

    # #authenticate() will return the user object if the password is correct
    if user&.authenticate(params[:password])&.present?
      session[:current_user_id] = user.id
      # TODO: later redirect the user to Notes page
      login_redirect 'Yay! logged in successfully!'
    else
      login_redirect 'Sorry, wrong email and/or password!'
    end
  end

  # POST /logout
  def destroy
    session[:current_user_id] = nil
    login_redirect "You're logged out!"
  end

  private
    def login_redirect(notice)
      redirect_to login_path, notice: notice
    end
end
