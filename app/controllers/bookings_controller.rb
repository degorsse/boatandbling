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
    @booking.user_id = current_user.id
    @booking.boat = @boat
    @booking.save
    redirect_to harbour_boat_bookings_path(@harbour, @boat)
  end

  def index
    @bookings = Booking.all.where(user:current_user)
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
