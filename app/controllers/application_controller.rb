class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name introduction image image_cache remove_image])
  end

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = t("not_authorized")
      redirect_to root_path
    end
  end

  def check_user_role
    redirect_to root_path, alert: t("not_edit_guest_user") if current_user.role == "guest"
  end
end
