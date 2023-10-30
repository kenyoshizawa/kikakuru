module UserCookiesHelper
  def remember_user(user)
    cookies.permanent.signed[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end
end
