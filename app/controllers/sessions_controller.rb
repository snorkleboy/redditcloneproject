class SessionsController < ApplicationController
  def index; end

  def show; end

  def new; end

  def create
    @user = User.find_by_cred(user_params[:username], user_params[:password])
    if @user.save
      login(user)
      # redirect
    end

  end

  def edit; end

  def update
    logout
  end
end
