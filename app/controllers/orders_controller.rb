class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart
  before_action :ensure_cart_not_empty, except: [:index, :show, :confirmation]

  def index
    @orders = current_user.orders.where.not(status: 'cart').order(created_at: :desc)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def checkout
    @order = @cart
  end

  def shipping
    if params[:order]
      @cart.update(shipping_params)
      redirect_to payment_orders_path
    end
  end

  def payment
    @order = @cart
    @amount_cents = (@order.total * 100).to_i
  end

  def process_payment
    begin
      # Intégration avec Stripe ou autre service de paiement
      @cart.update(status: 'paid', paid_at: Time.current)
      redirect_to confirmation_orders_path(@cart)
    rescue StandardError => e
      flash[:error] = "Erreur lors du paiement: #{e.message}"
      redirect_to payment_orders_path
    end
  end

  def confirmation
    @order = current_user.orders.find_by(status: 'paid')
  end

  private

  def set_cart
    @cart = Order.find_or_create_by(user: current_user, status: 'cart')
  end

  def ensure_cart_not_empty
    if @cart.order_items.empty?
      redirect_to cart_path, alert: 'Votre panier est vide.'
    end
  end

  def shipping_params
    params.require(:order).permit(
      :shipping_name,
      :shipping_address,
      :shipping_city,
      :shipping_postal_code,
      :shipping_country,
      :phone
    )
  end
end
