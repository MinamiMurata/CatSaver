class UsersController < ApplicationController
  before_action :set_user, only: %i[show blog_list withdrawal]
  before_action :check_user_role, only: :withdrawal

  def show
    @cats = @user.cats.all
    @blogs = @user.blogs.all.order(created_at: :desc).limit(3)
  end

  def blog_list
    @pagy, @blogs = pagy(@user.blogs.all.order(created_at: :desc))
  end

  def withdrawal
    deleted_email = @user.email + "_deleted_" + Time.current.strftime("%Y%m%d-%H%M")
    @user.update(name: "退会済みユーザー", email: deleted_email, image: nil, is_deleted: true, deleted_at: Time.current)
    reset_session
    redirect_to root_path, notice: t("canceled_your_account")
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
