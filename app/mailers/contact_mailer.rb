class ContactMailer < ActionMailer::Base
  def contact(attributes={})
    @attributes = attributes

    mail(
      to:      "contact@startupvictoria.com.au",
      from:    "\"#{attributes[:full_name]}\" <#{attributes[:email]}>",
      subject: "contact: #{attributes[:subject]}"
    )
  end
end
