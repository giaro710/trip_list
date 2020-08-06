class ItemsController < ApplicationController

  before_action :set_list, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :update, :destroy]

  def new
    # raise
    @trip = Trip.find(params[:trip_id])
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.list = @list
    authorize @item

    if @item.save
      redirect_to trip_path(@list.trip)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:trip_id])
  end

  def update
    if @item.update(item_params)
      redirect_to trip_path(@list.trip)
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to trip_path(@item.list.trip)
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :inside)
  end
end
