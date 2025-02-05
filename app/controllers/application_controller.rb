class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_cart
  include Pundit::Authorization  # Ajoutez cette ligne pour activer Pundit
  # Optionnel mais recommandé : gestion des erreurs Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!
  before_action :set_cart

  private

  def current_cart
    session[:cart] ||= {}
  end

  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action."
    redirect_to(root_path)
  end

  def set_cart
    @cart = current_user.orders.find_or_create_by(status: 'cart') if current_user
  end
end
