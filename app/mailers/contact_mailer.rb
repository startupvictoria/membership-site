class ContactMailer < ActionMailer::Base
  def contact(attributes={})
    @attributes = attributes

    mail(
      to:      "contact@startupvictoria.com.au",
      from:    "no-reply@startupvictoria.com.au",
      subject: "new contact"
    )
  end
end
