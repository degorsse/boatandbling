class BookingsController < ApplicationController
    before_action :find_harbour, only: [:create, :index, :show]
    before_action :set_boat, only: [:create, :index, :show]
    skip_before_action :authenticate_user!, only: :home

  def create
    @user= current_user
    # @booking = Booking.new
    # @booking.user = current_user

    redirect_to harbour_boats_booking_path(@harbour)
  end

  def index
    @bookings = Booking.all.where(user:current_user)
  end

  def show
  end

  def new
    @booking = Booking.new
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
      params.require(:booking).permit(:boat, :start_date, :end_date)
  end
end
