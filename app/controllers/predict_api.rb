module APIPredict
  def predict_news(content)
    url = "https://cyb-pbnestuqba-ew.a.run.app/predict?text=test"
    headers = { accept: "application/json" }

    begin
      response = RestClient.post(url, nil, headers)
      parsed_response = JSON.parse(response.body)

      puts parsed_response["fake"]
      puts parsed_response["probability"]
    rescue RestClient::ExceptionWithResponse => e
      render json: { error: e.response }, status: :unprocessable_entity
    rescue RestClient::Exception => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end
