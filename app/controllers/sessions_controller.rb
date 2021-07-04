class SessionsController < ActionController::Base
  def create
    return redirect_to posts_path if user && session[:user_id]

    if (@user ||= User.new).update_info(request.env["omniauth.auth"])
      session[:user_id] = user.id

      redirect_to posts_path, flash: { success: "You have successful signed in!" }
    else
      redirect_to root_path, flash: { danger: "Something went wrong!" }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { danger: "Successful logged out!" }
  end

  private

  def user
    @user ||= User.find_by(email: request.env["omniauth.auth"].info.email)
  end
end
