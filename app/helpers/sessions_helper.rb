module SessionsHelper
	def sign_in(user)
		sessions[:user_id] = user.id
	end

  	def signed_in?
    	!current_user.nil?
  	end

  	def current_user=(user)
    	@current_user ||= User.find_by(id: session[:user_id])
  	end

  	def sign_out
  		self.current_user = nil
  	end

	def redirect_back_to(default)
    	redirect_to(session[:return_to] || default)
    	session.delete(:return_to)
  	end
end