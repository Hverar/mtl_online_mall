class MtlEventsController < ApplicationController
  def index
    @events = MtlEvent.all
  end

  def show
    @event = MtlEvent.find(params[:id])
  end
end
