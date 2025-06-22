class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.includes(:favoritable)
  end

  def create
    favoritable = find_favoritable
    favorite = current_user.favorites.create(favoritable: favoritable)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("favorite-toggle-#{favoritable.id}", partial: "favorites/favorite_toggle", locals: { favoritable: favoritable, favorite: favorite })
      end
      format.html { redirect_back fallback_location: root_path }
    end
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favoritable = favorite.favoritable
    favorite.destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("favorite-toggle-#{favoritable.id}", partial: "favorites/favorite_toggle", locals: { favoritable: favoritable, favorite: nil })
      end
      format.html { redirect_back fallback_location: root_path }
    end
  end

  private

  def find_favoritable
    type = params[:type].constantize
    type.find(params[:id])
  end
end
