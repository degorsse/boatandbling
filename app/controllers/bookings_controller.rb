class BookingsController < ApplicationController
  def create
  end

  def index
    @bookings = Booking.all
    @harbours= Harbour.all

  end

  def show
  end

  def new
    @booking = Booking.new
  end
end
