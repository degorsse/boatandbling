class Booking < ActiveRecord::Base
  belongs_to :boat
  # has_many :harbours, :through => :categorizations
end
