class TractorsController < ApplicationController
  before_action :find_tractor, only: %i[show]

  def index
    if params['q'] == 'reward'
      @tractors = Tractor.order(reward: :desc)
    elsif params['q'] == 'oldest'
      @tractors = Tractor.order(created_at: :asc)
    elsif params['q'] == 'newest'
      @tractors = Tractor.order(created_at: :desc)
    else
      @tractors = Tractor.all
    end
  end

  def map
    @tractors = Tractor.geocoded #returns flats with coordinates

    @markers = @tractors.map do |tractor|
      {
        lat: tractor.latitude,
        lng: tractor.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { tractor: tractor })
      }
    end
  end

  def show
  end

  def new
    @tractor = Tractor.new
  end

  def create
    @tractor = Tractor.new(tractor_params)
    @tractor.user = current_user
    @tractor.save
    redirect_to root_path
  end

  private

  def find_tractor
    @tractor = Tractor.find(params[:id])
  end

  def tractor_params
    params.require(:tractor).permit(:name, :address, :reward, :details, :photo, :user)
  end

end
