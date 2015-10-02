class Booking < ActiveRecord::Base
  belongs_to :boat
  belongs_to :user
  # has_many :harbours, :through => :categorizations
end
