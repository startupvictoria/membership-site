class PersonDecorator < Draper::Decorator
  delegate_all

  def name_linked_to
    if context[:href_style] == :url && !url.blank?
      h.link_to name, url
    elsif context[:href_style] == :email && !email.blank?
      h.link_to name, "mailto:#{email}"
    else
      name
    end
  end

end
