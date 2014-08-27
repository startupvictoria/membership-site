class MembershipPlan < Struct.new(:id, :price_cents)
  def self.premium
    new("premium", 9900)
  end

  def self.free
    new("free", 0)
  end

  def self.all
    [ "premium", "free" ]
  end
end
