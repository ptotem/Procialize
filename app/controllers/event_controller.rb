class EventController < ApplicationController
  def index
  end

  def show
    @user=current_user
    @event = Event.find(params[:id])

  end
end
