class EventPromoter < ActiveRecord::Base
  def self.from_param(code)
    EventPromoter.find_by_code code.to_s
  end

  def to_param
    code
  end

end
