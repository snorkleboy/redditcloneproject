class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def index; end

  def show; end

  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      login(user)
      # redirect
    end
  end

  def edit; end

  def update; end
end
