module SessionsHelper

	def sign_in(user)
		session[:user_id] = user.id
	end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user.nil?
  end

	def sign_out
    session.delete(:user_id)
		@current_user = nil
	end

	def redirect_back_to( path )
    	redirect_to(session[:return_to] || path)
    	session.delete(:return_to)
	end
end