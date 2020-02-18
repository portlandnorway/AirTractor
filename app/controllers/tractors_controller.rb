class TractorsController < ApplicationController
  def index
    @tractors = Tractor.all
  end
end
