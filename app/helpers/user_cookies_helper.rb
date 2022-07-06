module UserCookiesHelper
  def remember_user(user)
    cookies.permanent.signed[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  # def logged_in?
  #   !current_user.nil?
  # end

  def forget(current_user)
    @current_user = nil
    cookies.delete(:user_id)
  end
end
