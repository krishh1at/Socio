class HomeController < ActionController::Base
  before_action :already_signed_in

  def index
    render layout: "home"
  end

  private

  def already_signed_in
    @user ||= User.find_by(id: session[:user_id])

    redirect_to posts_path if @user
  end
end
