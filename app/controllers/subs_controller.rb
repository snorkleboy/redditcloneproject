class SubsController < ApplicationController
  before_action :login_check
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def show; end

  def index; end

  def edit
    @sub = current_user.owned_subs.find(params[:id])
    if @sub
      render :edit
    else

      "get outta here boi"
    end
  end

  def update
    @sub = current_user.owned_subs.find(params[:id])
    if @sub && @sub.update(sub_params)

    else
      "get outta here boi"
    end
  end

  def new; end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user.id
    if @sub.save

    else

    end
  end

  def check_ownership; end
end
