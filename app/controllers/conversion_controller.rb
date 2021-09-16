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
    { params[:text_or_ssml] => params[:request] }
  end

  def voice
    { language_code: params[:lang],
      name: params[:voicename] }
  end

  def audio
    { audio_encoding: params[:codec],
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
    flash[:error] = 'Invalid request format'
  end

  private

  def form_params
    params.permit(:request)
  end
end
