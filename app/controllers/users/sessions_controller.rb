# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: t("guest_signed_in")
  end

  def guest_admin_sign_in
    admin = User.guest_admin
    sign_in admin
    redirect_to admin_root_path, notice: t("guest_admin_signed_in")
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
