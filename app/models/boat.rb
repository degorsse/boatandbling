class Boat < ActiveRecord::Base
  belongs_to :harbour
  has_many :bookings, dependent: :destroy

  has_attached_file :picture,
    styles: { medium: "300x300", thumb: "100x100" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def self.search(query)
  end

end
