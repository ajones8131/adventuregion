# Controller for User Sessions during the Sign in/up process.
class SessionsController < ApplicationController

 	def new
 	end

	def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
    		sign_in user
    		redirect_to user
  	else
    	flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
  	end
	end

	def destroy
    reset_session
    @current_user = nil
  	redirect_to signin_path
	end
end
