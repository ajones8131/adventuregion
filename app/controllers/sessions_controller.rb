class SessionsController < ApplicationController
  # def new
  # end

  # def create
  # 	user = User.find_by_email(params[:sessions][:email].downcase)
  # 	if user && user.authenticate(params[:sessions][:password])
  # 		log_in user
  # 		params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  # 		remember user
  # 		redirect_to user_path
  # 	else
  # 		flash[:danger] = 'Invalid Email/Password combination'
  # 		render 'new'
  # 	end
  # end

  # def destroy
  # 	log_out if logged_in?
  # 	redirect_to root_url
  # end
end
