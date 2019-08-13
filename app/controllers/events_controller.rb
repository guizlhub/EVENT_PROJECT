class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
  end

  def create
    event_params = params.require(:event).permit(
      :start_date,
      :duration,
      :title,
      :description,
      :price,
      :location
    )
    @event = Event.new(event_params)
    @event.admin = current_user
    if @event.save
      flash[:success] = "L'événement a bien été créé !"
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
