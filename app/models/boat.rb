class Boat < ActiveRecord::Base
  belongs_to :harbour
  has_many :bookings, dependent: :destroy
  def self.search(query)
  end

end
