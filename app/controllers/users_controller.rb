class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cats = current_user.cats.all
    @blogs = current_user.blogs.all.order(created_at: :desc).limit(3)
  end
end
