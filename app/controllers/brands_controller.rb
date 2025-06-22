class BrandsController < ApplicationController
  def index
    if params[:query].present?
      @brands = Brand.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @brands = Brand.all
    end
  end

  def show
    @brand = Brand.find(params[:id])
  end
end
