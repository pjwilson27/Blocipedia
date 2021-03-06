class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  
  private
  
  def user_not_authorized
    flash[:alert] = "You are not authorized to do that activity."
    redirect_to(root path)
  end
end
