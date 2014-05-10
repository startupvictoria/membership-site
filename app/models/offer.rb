class Offer < ActiveRecord::Base
  def self.from_param(name)
    Offer.find_by_name name.to_s
  end

  def to_param
    name
  end

  def logo_path
    "/assets" + logo_url
  end
  
end
