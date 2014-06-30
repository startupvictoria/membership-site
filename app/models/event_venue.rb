class EventVenue < ActiveRecord::Base
  validates :code, presence: true

  before_validation do |ev|
    ev.code = ev.code.downcase
  end

  def self.from_param(code)
    EventVenue.find_by_code code.to_s
  end

  def to_param
    code
  end

end
