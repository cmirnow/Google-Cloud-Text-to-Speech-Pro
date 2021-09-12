module ConversionHelper
  def speaking_rate
    select_tag 'speaking_rate', options_for_select(
      0.50.step(by: 0.125, to: 2.0), selected: '1.0'
    ), { class: 'btn btn-sm btn-light dropdown-toggle' }
  end
end
