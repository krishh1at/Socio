class ApplicationController < ActionController::Base
  before_action :authenticate_user

  helper_method :current_user

  private

  def authenticate_user
    redirect_to root_path, flash: { danger: "You have not signed in!" } unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
