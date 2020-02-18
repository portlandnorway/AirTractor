class TractorsController < ApplicationController
  before_action :find_tractor, only: %i[show]

  def index
    @tractors = Tractor.all
  end

  def show
  end

  def new
    @tractor = Tractor.new
  end

  def create
    @tractor = Tractor.new(tractor_params)
    raise
    @tractor.save
    redirect_to root_path
  end

  private

  def find_tractor
    @tractor = Tractor.find(params[:id])
  end

  def tractor_params
    params.require(:tractor).permit(:name, :address, :reward, :details, :photo)
  end

end
