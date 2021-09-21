module ConversionHelper
  def speaking_rate
    select_tag 'speaking_rate', options_for_select(
      0.50.step(by: 0.125, to: 2.0), selected: '1.0'
    ), { class: 'btn btn-sm btn-light dropdown-toggle' }
  end

  def credentials_exist?
    t = ENV['GOOGLE_APPLICATION_CREDENTIALS']; t.present? && File.exist?(t)
  end

  def choose_locale
    options_for_select([
                         ['Choose language', nil],
                         ['Dansk (Danmark)', 'da-DK'],
                         ['Deutsch (Deutschland)', 'de-DE'],
                         ['English (Australia)', 'en-AU'],
                         ['English (Great Britain)', 'en-GB'],
                         ['English (India)', 'en-IN'],
                         ['English (United States)', 'en-US'],
                         ['Español (España)', 'es-ES'],
                         ['Français (Canada)', 'fr-CA'],
                         ['Français (France)', 'fr-FR'],
                         ['Italiano (Italia)', 'it-IT'],
                         ['Nederlands (Nederland)', 'nl-NL'],
                         ['Polski (Polska)', 'pl-PL'],
                         ['Português (Brasil)', 'pt-BR'],
                         ['Português (Portugal)', 'pt-PT'],
                         ['Suomi (Suomi)', 'fi-FI'],
                         ['Ελληνικά (Ελλάδα)', 'el-GR'],
                         ['Русский (Россия)', 'ru-RU'],
                         ['Українська (Україна)', 'uk-UA']
                       ])
  end
end
