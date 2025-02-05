class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def show
    @cart_items = @cart.order_items.includes(:product)
    @total = calculate_total
  end

  def add_item
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i || 1

    @item = @cart.order_items.find_or_initialize_by(product: product)
    @item.quantity += quantity

    respond_to do |format|
      if @item.save
        format.html { redirect_to cart_path, notice: 'Produit ajouté au panier.' }
        format.json { render json: {
          cart_count: @cart.order_items.sum(:quantity),
          cart_total: helpers.number_to_currency(calculate_total)
        } }
      else
        format.html { redirect_to products_path, alert: 'Erreur lors de l\'ajout au panier.' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_quantity
    item = @cart.order_items.find_by(product_id: params[:product_id])

    if item.update(quantity: params[:quantity])
      render json: {
        item_total: helpers.number_to_currency(item.total),
        cart_total: helpers.number_to_currency(calculate_total)
      }
    else
      render json: { error: 'Erreur lors de la mise à jour' }, status: :unprocessable_entity
    end
  end

  def remove_item
    item = @cart.order_items.find_by(product_id: params[:product_id])
    item.destroy if item

    respond_to do |format|
      format.html { redirect_to cart_path, notice: 'Produit retiré du panier.' }
      format.json { render json: {
        cart_count: @cart.order_items.sum(:quantity),
        cart_total: helpers.number_to_currency(calculate_total)
      } }
    end
  end

  private

  def set_cart
    @cart = Order.find_or_create_by(user: current_user, status: 'cart')
  end

  def calculate_total
    @cart.order_items.sum { |item| item.product.price * item.quantity }
  end
end
