class UsersController < ApplicationController
  before_action :set_user, only: :show

  def show
    @cats = current_user.cats.all
    @blogs = current_user.blogs.all.order(created_at: :desc).limit(3)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
