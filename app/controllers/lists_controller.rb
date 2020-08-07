class ListsController < ApplicationController

  before_action :set_user
  before_action :set_trip, only: [:new, :create, :edit, :update]
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # def index
  #   # @lists = list.all
  #   @lists = policy_scope(List)
  # end

  # def show
  # end

  # def new
  #   @list = List.new
  #   authorize @list
  # end

  def create
    @list = List.new(list_params)
    @list.trip = @trip
    authorize @list

    if @list.save
      redirect_to trip_path(@trip, anchor: "list-#{@list.id}")
    else
      redirect_to trip_path(@trip, anchor: "lists")
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to trip_path(@list.trip, anchor: "lists")
  end

  private

  def set_user
    @user = current_user
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_list
    @list = List.find(params[:id])
    authorize @list
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
