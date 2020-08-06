class SuitcasesController < ApplicationController

  before_action :set_user
  before_action :set_suitcase, only: [:show, :edit, :update, :destroy]

  # def index
  #   @suitcases = policy_scope(Suitcase)
  # end

  # def show
  # end

  def new
    @suitcase = Suitcase.new
    authorize @suitcase
  end

  def create
    @suitcase = Suitcase.new(suitcase_params)
    @suitcase.user = @user
    authorize @suitcase

    if @suitcase.save
      redirect_to "/profile"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @suitcase.update
      redirect_to "/profile"
    else
      render :edit
    end
  end

  def destroy
    @suitcase.destroy
    redirect_to "/profile"
  end

  private

  def set_user
    @user = current_user
  end

  def set_suitcase
    @suitcase = Suitcase.find(params[:id])
    authorize @suitcase
  end

  def suitcase_params
    params.require(:suitcase).permit(:name)
  end
end
