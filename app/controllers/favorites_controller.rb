class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favoritable = find_favoritable
    current_user.favorites.find_or_create_by(favoritable: favoritable)
    redirect_back fallback_location: root_path
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy
    redirect_back fallback_location: root_path
  end

  def index
    @favorites = current_user.favorites.includes(:favoritable)
  end

  private

  def find_favoritable
    params[:type].constantize.find(params[:id])
  end
end
