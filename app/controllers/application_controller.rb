class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :authenticate_usuario!
  
  def account_update_params
  end
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  has_scope :with_query

  before_action :set_paper_trail_whodunnit

  protected

  # Used by paper_trail.
  def current_user
    current_usuario
  end

  # Used by devise.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |params|
      params.permit(:nome, :email, :password, :password_confirmation, :current_password, :avatar)
    end
  end

  # Pundit user.
  def pundit_user
    current_usuario
  end

  # Default action for unauthorized access.
  def user_not_authorized
    flash[:alert] = "Você não está autorizado a executar esta operação."
    redirect_to(request.referrer || root_path)
  end

end
