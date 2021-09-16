class Translate
  def self.api_request(path, method: :get, body: nil)
    params = {
      headers: {
        'x-rapidapi-key': ENV['RAPIDAPI_KEY'],
        'content-type': 'application/x-www-form-urlencoded'
      }
    }

    params[:body] = body if body

    response = Excon.send(
      method,
      "https://google-translate1.p.rapidapi.com/#{path}",
      params
    )

    JSON.parse(response.body)
  end
end
