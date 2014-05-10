class MembershipPlan < Struct.new(:id, :price_cents)
  def self.premium
    new("premium", 9900)
  end
end
