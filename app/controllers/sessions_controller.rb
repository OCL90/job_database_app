class SessionsController < ApplicationController
  
  def create
  	user = User.new(user_params)
  	if user.save
  		session[:user_id] = user.id
  		redirect_to "/application/dashboard"
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to :back
  	end
  end

  def login
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to "/application/dashboard"
  	else
  		flash[:errors] = ["Invalid Credentials"]
  		redirect_to :back
  	end
  end

  def destroy
  	session.clear
  	redirect_to :root
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
