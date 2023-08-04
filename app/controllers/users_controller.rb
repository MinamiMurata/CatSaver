class UsersController < ApplicationController
  before_action :set_user, only: %i[show blog_list]

  def show
    @cats = @user.cats.all
    @blogs = @user.blogs.all.order(created_at: :desc).limit(3)
  end

  def blog_list
    @pagy, @blogs = pagy(@user.blogs.all.order(created_at: :desc))
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
