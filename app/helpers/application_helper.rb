module ApplicationHelper

  def full_site_title(page_title)
    site_name = "Markdown Blog"
    if page_title.present?
      "#{page_title} - #{site_name}"
    else
      "#{site_name}"
    end
  end

end
