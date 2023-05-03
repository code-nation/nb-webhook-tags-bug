module ApplicationHelper
  def alert_class(flash_key)
    case flash_key
      when 'notice'
        'alert-success'
      when 'alert'
        'alert-danger'
      when 'error'
        'alert-danger'
      when 'warning'
        'alert-warning'
      when 'success'
        'alert-success'
      else
        'alert-info'
    end
  end

  def generate_pretty_list(tag_array)
    tag_list_elements = tag_array.sort.map { |tag_name| tag.li tag_name }
    content_tag(:ul, tag_list_elements.join(" ").html_safe)
  end
end
