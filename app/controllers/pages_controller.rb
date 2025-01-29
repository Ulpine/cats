class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home  # Permet l'accès à home sans auth
  def home
  end
end
