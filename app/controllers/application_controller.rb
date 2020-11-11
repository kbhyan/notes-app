class ApplicationController < ActionController::Base
  before_action :authorize

  private
    # authorize and set the current user to use among all operations
    def authorize
      id = session[:current_user_id]
      @current_user ||= User.find(id)

    rescue ActiveRecord::RecordNotFound
      redirect_to login_path, notice: 'Not authorized, please login first'
    end
end
