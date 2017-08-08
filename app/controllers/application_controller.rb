class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user!

  # The Helper methods needed to help us in our controllers and our views
  #   is_logged_in?
  #   current_user
  #   authenticate_user! (if user isn't logged in, send them to a login screen)
  def index
    render html: "Welcome!"
  end

  private

  def current_user # check if a current_user has been defined
    # if not look for a user using the user_id key in the session
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authenticate_user!
    redirect_to new_session_path unless logged_in?
  end
end
