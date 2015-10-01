class BookingsController < ApplicationController
  def create
  end

  def index
    @bookings = Booking.all
    @harbour= Harbour.all.sample
    # @harbour = .find(params[:id])
  end

  def show
  end

  def new
    Devise.user_signed_in?(user)
    @booking = Booking.new
  end
  def home
  end
end
