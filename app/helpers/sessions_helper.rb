module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  def current_user
    @current_user ||= Instructor.find_by(id: session[:user_id]) if session[:user_id]
  end
  def logged_in?
    !current_user.nil?
  end
  def not_logged?
    current_user.nil?
  end
  def is_inst?
    !current_user.nil? && !current_user.admin?
  end
  def is_admin?
    @current_user && @current_user.admin?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
