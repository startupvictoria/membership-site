class MembershipCreatedPreview < ActionMailer::Preview
  def create
    MembershipCreatedMailer.create User.first 
  end
  
  def create_with_phone_number
    MembershipCreatedMailer.create \
      User.where("phone_number IS NOT NULL").first
  end
  
  def notify
    MembershipCreatedMailer.notify User.first 
  end
end
