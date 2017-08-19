class UserController < ApplicationController
  def index
    @users = User.all.select(:first_name, :last_name, :email)
  end
end
