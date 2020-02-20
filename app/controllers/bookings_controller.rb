class BookingsController < ApplicationController
  # def new
  #   @tractor = Tractor.find(params[:tractor_id])
  #   @booking = Booking.new
  # end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.tractor_id = params[:tractor_id]
    @booking.save
    # Or should we redirect to a booking path or a profile page
    redirect_to booking_path(@booking)
  end

  def show
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
