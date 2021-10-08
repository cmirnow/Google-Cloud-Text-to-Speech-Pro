class TtsConversion
  def self.index(*args)
    response = args[0].synthesize_speech input: args[1],
                                         voice: args[2],
                                         audio_config: args[3]
    file_write(*args, response)
  end

  def self.file_write(*args, response)
    File.open Rails.root.join(
      'public',
      'output',
      "#{args[5]}.#{audio_format(args[4])}"
    ),
              'wb' do |file|
      file.write response.audio_content
      audio_format(args[4])
    end
  end

  def self.audio_format(codec)
    case codec
    when 'LINEAR16'
      'wav'
    when 'OGG_OPUS'
      'ogg'
    else
      'mp3'
    end
  end
end
