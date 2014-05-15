require 'active_model'

class ContactForm
  include ActiveModel::Model

  attr_accessor :email
  attr_accessor :full_name
  attr_accessor :phone
  attr_accessor :message

  validates :full_name,
    presence: true

  validates :email,
    presence: true,
    format: {with: Formats::EMAIL}

  validates :message,
    presence: true

  def initialize(attributes={})
    @attributes = attributes
    super
  end

  def save
    return false unless valid?

    ContactMailer.contact(attributes).deliver

    true
  end

  private

  attr_reader :attributes
end
