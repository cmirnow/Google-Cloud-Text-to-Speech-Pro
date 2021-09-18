class Translate
  # Use Google Cloud Translate API across RapidAPI (REST):
  #   def self.api_request(path, method: :get, body: nil)
  #     params = {
  #       headers: {
  #         'x-rapidapi-key': ENV['RAPIDAPI_KEY'],
  #         'content-type': 'application/x-www-form-urlencoded'
  #       }
  #     }
  #
  #     params[:body] = body if body
  #
  #     response = Excon.send(
  #       method,
  #       "https://google-translate1.p.rapidapi.com/#{path}",
  #       params
  #     )
  #
  #     JSON.parse(response.body)
  #   end

  def self.api_request(params)
    translate = Google::Cloud::Translate::V2.new project_id: ENV['CLOUD_PROJECT_ID']
    translate.translate params[:request], to: params[:lang][0..1]
  end
end
