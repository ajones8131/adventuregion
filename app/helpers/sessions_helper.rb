module SessionsHelper

  #Signs in the given user
	def sign_in(user)
		session[:user_id] = user.id
	end

  # Returns the current signed-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Checks to see if user is signed in or not.
  def signed_in?
    !current_user.nil?
  end
end