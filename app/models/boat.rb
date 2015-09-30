class Boat < ActiveRecord::Base
  belongs_to :harbour

  def self.search(query)
  end

end
