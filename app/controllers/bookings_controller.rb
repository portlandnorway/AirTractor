class BookingsController < ApplicationController
  # def new
  #   @tractor = Tractor.find(params[:tractor_id])
  #   @booking = Booking.new
  # end

  def create
    @booking = Booking.new(tractor_id: params[:tractor_id], user_id: current_user.id)
    @booking.save
    @tractor = Tractor.find(params[:tractor_id])
    # Or should we redirect to a booking path or a profile page
    redirect_to booking_path(@booking)
  end

  def show
    raise
  end
end
