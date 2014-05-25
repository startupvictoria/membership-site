class EventVenue < ActiveRecord::Base
  def self.from_param(code)
    EventVenue.find_by_code code.to_s
  end

  def to_param
    code
  end

end
