module ConversionHelper
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
