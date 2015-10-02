class BookingsController < ApplicationController
    before_action :find_harbour, only: [:new, :create, :index, :show]
    before_action :set_boat, only: [:new, :create, :index, :show]
    skip_before_action :authenticate_user!, only: :home

  def new
    @booking = Booking.new(boat: @boat, start_date: params[:start_date_search], end_date: params[:end_date_search] )
    @user= current_user
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.boat = @boat
    @booking.save
    price_calculation
    redirect_to harbour_boat_bookings_path(@harbour, @boat)
  end
  def price_calculation
    if @booking.start_date > @booking.end_date
      @booking.total_price = 0
    else
      duration = @booking.end_date-@booking.start_date
      @booking.total_price = @booking.boat.price_per_day * duration
    end
  end
  def index
    @user = current_user
    @bookings = Booking.all.where(user:current_user)
    @total_amount="1230 EUR"
  end

  def show
  end


  def home
  end
  private
    # Use callbacks to share common setup or constraints between actions.

  def set_boat
      @boat = Boat.find(params[:boat_id])
  end

  def find_harbour
      @harbour = Harbour.find(params[:harbour_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
      params.require(:booking).permit(:start_date, :end_date)
  end
end
