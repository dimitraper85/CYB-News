class PredictNewsService
  def self.predict_news(content)
    sanitized_text = URI.encode_www_form_component(content)
    url = "https://cyb-pbnestuqba-ew.a.run.app/predict?text=#{sanitized_text}"
    headers = { accept: "application/json" }

    begin
      response = RestClient.post(url, nil, headers)
      parsed_response = JSON.parse(response.body)
      return { fake: parsed_response["fake"], probability: parsed_response["probability"] }
    rescue RestClient::ExceptionWithResponse => e
      p e
      # raise PredictNewsError, "API call failed with status: #{e.http_code}"
    rescue RestClient::Exception => e
      p e
      # raise PredictNewsError, "API call failed: #{e.message}"
    end
  end
end

class PredictNewsError < StandardError; end
