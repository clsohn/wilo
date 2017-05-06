class Weather

  attr_accessor  :temp, :condition, :wspd, :humidity, :snow

  def initialize(temp, condition, wspd, humidity, snow)
    
    response = HTTParty.get('http://api.wunderground.com/api/ce0783e06625adc3/hourly/q/MA/Boston.json')
    data = response.parsed_response
    @temp = data["hourly_forecast"][0]["temp"]["english"]
    @condition = data["hourly_forecast"][0]["condition"]
    @wspd = data["hourly_forecast"][0]["wspd"]["english"]
    @humidity = data["hourly_forecast"][0]["humidity"]
    @snow = data["hourly_forecast"][0]["snow"]["english"]
  end
end
