module ConversionHelper
  def speaking_rate
    select_tag 'speaking_rate', options_for_select(
      0.50.step(by: 0.125, to: 2.0), selected: '1.0'
    ), { class: 'btn btn-sm btn-light dropdown-toggle' }
  end

  def pitch
    select_tag 'pitch', options_for_select(
      -9.step(by: 1.5, to: 9), selected: '0.0'
    ), { class: 'btn btn-sm btn-light dropdown-toggle' }
  end

  def credentials_exist?
    t = ENV['GOOGLE_APPLICATION_CREDENTIALS']; t.present? && File.exist?(t)
  end

  def audio_device_profile
    options_for_select([
                         ['Default'],
                         ['Smart watch or wearable', 'wearable-class-device'],
                         %w[Smartphone handset-class-device],
                         ['Headphones or earbuds', 'headphone-class-device'],
                         ['Small home speaker', 'small-bluetooth-speaker-class-device'],
                         ['Smart home speaker', 'medium-bluetooth-speaker-class-device'],
                         ['Home entertainment system or smart TV', 'large-home-entertainment-class-device'],
                         ['Car speaker', 'large-automotive-class-device'],
                         ['Interactive Voice Response (IVR) system', 'telephony-class-application']
                       ])
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
