class CartsController < ApplicationController
  def show
    cart_ids = session[:cart] || []
    @products = Product.where(id: cart_ids)
  end

  def add
    session[:cart] ||= []
    session[:cart] << params[:product_id].to_i
    session[:cart].uniq!

    @products = Product.where(id: session[:cart])

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "cart-sidebar",
          partial: "carts/cart_sidebar",
          locals: { products: @products }
        )
      end

      format.html do
        redirect_back fallback_location: product_path(params[:product_id]), notice: "Product added to cart."
      end
    end
  end

  def remove
    session[:cart] ||= []
    session[:cart].delete(params[:product_id].to_i)

    @products = Product.where(id: session[:cart])

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "cart-sidebar",
          partial: "carts/cart_sidebar",
          locals: { products: @products }
        )
      end

      format.html do
        redirect_back fallback_location: root_path, notice: "Product removed from cart."
      end
    end
  end
end
