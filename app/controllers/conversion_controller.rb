class ConversionController < ApplicationController
  before_action :authenticate_admin!

  def index
    return if params[:request].nil?

    if check.valid?
      conversion
    else
      error_info
    end
  end

  def conversion
    audio_format = TtsConversion.index(
      client,
      synthesis_input,
      voice,
      audio,
      params[:codec],
      params[:title]
    )
    storage(audio_format) if params[:storage] == '1'
    success_info(audio_format)
  end

  def translate
    Translate.api_request(params).to_s
  end

  # Use Google Cloud Translate API across RapidAPI (REST):
  #
  #   def translate
  #     body = {
  #       q: params[:request],
  #       target: params[:lang][0..1]
  #     }
  #
  #     translation = Translate.api_request(
  #       'language/translate/v2',
  #       method: :post,
  #       body: URI.encode_www_form(body)
  #     )
  #
  #     translation['data']['translations'].first['translatedText']
  #   end

  def storage(audio_format)
    find_admin
    @admin.files.attach(
      io: File.open(
        Rails.root.join(
          'public',
          'output',
          "#{params[:title]}.#{audio_format}"
        )
      ),
      filename: "#{params[:title]}.#{audio_format}"
    )
  end

  def client
    Google::Cloud::TextToSpeech.text_to_speech
  end

  def synthesis_input
    { params[:text_or_ssml] => translate_on? }
  end

  def translate_on?
    if params[:translate] == '1'
      translate
    else
      params[:request]
    end
  end

  def voice
    { language_code: params[:lang],
      name: params[:voicename] }
  end

  def audio
    { audio_encoding: params[:codec],
      effects_profile_id: [params[:audio_device_profile]],
      pitch: params[:pitch].to_f,
      speaking_rate: params[:speaking_rate].to_f }
  end

  def check
    Validation.new(form_params)
  end

  def success_info(audio_format)
    respond_to do |format|
      format.js do
        flash.now[:success] = "<a href='/output/#{params[:title]}.#{audio_format}'
      download>Download #{params[:title]}.#{audio_format}</a>".html_safe
      end
    end
  end

  def error_info
    flash.now[:error] = 'Invalid request format'
  end

  private

  def form_params
    params.permit(:request)
  end
end
