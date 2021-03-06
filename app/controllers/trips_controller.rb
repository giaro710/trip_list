class TripsController < ApplicationController

  before_action :set_user
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    # @trips = Trip.all

    if params[:query].present?
      @trips = policy_scope(Trip).search_by_trip_name_and_destination(params[:query])  # .with_pg_search_highlight
    else
      @trips = policy_scope(Trip).order(created_at: :desc)
    end

    @markers = @trips.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude
      }
    end
  end

  def show

    @markers = Trip.where(id: @trip.id).map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude
      }
    end

    @lists = List.where(trip: @trip)

    @list = List.new

    @item = Item.new
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = @user
    authorize @trip

    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trips_path
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def trip_params
    params.require(:trip).permit(:name, :destination, :start_date, :end_date)
  end
end
