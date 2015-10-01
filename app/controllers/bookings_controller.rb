class BookingsController < ApplicationController
    skip_before_action :authenticate_user!, only: :home
  def create
  end

  def index
    @bookings = Booking.all
    @harbours= Harbour.all

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
