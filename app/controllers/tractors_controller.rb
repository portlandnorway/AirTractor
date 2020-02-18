class TractorsController < ApplicationController
  before_action :find_tractor, only: %i[show]

  def index
    @tractors = Tractor.all
  end

  def show
  end

  private

  def find_tractor
    @tractor = Tractor.find(params[:id])
  end
end
