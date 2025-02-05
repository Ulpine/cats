class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home  # Permet l'accès à home sans auth
  def home
    @featured_products = Product.featured.limit(6)
  end

  def about
    # Add any necessary logic for the about page
  end
end
