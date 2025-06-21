class CartController < ApplicationController
  def show
    cart_ids = session[:cart] || []
    @products = Product.where(id: cart_ids)
  end

  def add
    session[:cart] ||= []
    session[:cart] << params[:product_id].to_i
    session[:cart].uniq!
    redirect_back fallback_location: product_path(params[:product_id]), notice: "Product added to cart."
  end


  def remove
    session[:cart] ||= []
    session[:cart].delete(params[:product_id].to_i)
    redirect_to cart_path, notice: "Product removed from cart."
  end
end
