class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :brands, :music, :events, :advertise, :searchbar, :discover]

  def home; end
  def brands; end
  def music; end

  def events
    @events = MtlEvent.all
  end

  def advertise; end
  def searchbar; end

  def discover
  end

  def brands
    @brands = Brand.all
  end

  def music
    @musics = Music.all
  end


end
