class ItemsController < ApplicationController

  before_action :set_list, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:create, :edit, :update, :destroy]

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.list = @list

    if @item.save
      redirect_to trip_path(@list.trip)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update
      redirect_to trip_path(@list.trip)
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to trip_path(@list.trip)
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
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :inside)
  end
end
