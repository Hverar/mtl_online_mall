class MusicsController < ApplicationController
  before_action :set_music, only: [:show, :edit, :update]

  def index
    @artists = Artist.includes(:songs)
  end

  def show
  end

  def edit
  end

  def update
    if @music.update(music_params)
      redirect_to @music, notice: "Music updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_music
    @music = Music.find(params[:id])
  end

  def music_params
    params.require(:music).permit(:title, :artist, :genre, :description, :cover_image)
  end
end
