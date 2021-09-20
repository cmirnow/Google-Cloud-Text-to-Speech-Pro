module ApplicationHelper
  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'warning'
      'alert-warning'
    when 'alert'
      'alert-primary'
    else
      'alert-info'
    end
  end

  def svg_icon(flash_type)
    case flash_type
    when 'success'
      '#check-circle-fill'
    when 'error'
      '#exclamation-triangle-fill'
    when 'warning'
      '#exclamation-triangle-fill'
    when 'alert'
      '#info-fill'
    else
      '#info-fill'
    end
  end

  def date
    Date.today.strftime('%d of %B %Y, %A')
  end
end
