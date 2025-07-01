class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :brands, :music, :events, :advertise, :searchbar, :discover]

  def home; end

  def events
    @events = MtlEvent.all
  end

  def advertise; end

  def discover; end

  def brands
    @brands = Brand.all
  end

  def music
    @musics = Music.all
  end

  def searchbar
    @query = params[:query]

    if @query.present?
      @products = Product.where("name ILIKE ?", "%#{@query}%")
      @brands   = Brand.where("name ILIKE ?", "%#{@query}%")
      @events   = MtlEvent.where("name ILIKE ?", "%#{@query}%")
      @songs    = Song.where("title ILIKE ?", "%#{@query}%")
      @artists  = Artist.where("name ILIKE ?", "%#{@query}%")
      @albums   = Music.where("title ILIKE ?", "%#{@query}%")
    else
      @products = []
      @brands = []
      @events = []
      @songs = []
      @artists = []
      @albums = []
    end
  end

end
