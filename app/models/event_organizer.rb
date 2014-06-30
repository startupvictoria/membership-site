class EventOrganizer < ActiveRecord::Base
  validates :code, presence: true

  before_validation do |eo|
    eo.code = eo.code.downcase
  end

  def self.from_param(code)
    EventOrganizer.find_by_code code.to_s
  end

  def to_param
    code
  end

end
