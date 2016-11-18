class UsersController < ApplicationController
  def main
  	@user = User.find(session[:user_id])
  end
end
