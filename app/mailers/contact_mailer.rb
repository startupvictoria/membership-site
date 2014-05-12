class ContactMailer < ActionMailer::Base
  def contact(attributes={})
    @attributes = attributes

    mail(
      to:      "contact@startupvictoria.com.au",
      from:    "\"#{white_in_from(:full_name)}\" <#{white_in_from(:email)}>",
      subject: "contact: #{white_in_subject(:subject)}"
    )
  end

  private

  def white_in_from(key)
    @attributes[key].gsub(/[\r\n<>\"]/, '').slice(0..253)
  end

  def white_in_subject(key)
    @attributes[key].gsub(/[\r\n]/, '').slice(0..998)
  end
end
