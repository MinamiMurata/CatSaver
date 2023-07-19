class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cats = current_user.cats.all
    @blogs = current_user.blogs.all
  end
end
