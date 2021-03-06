class Weather

  attr_accessor  :temp, :condition, :wspd, :humidity, :snow, :location

  def initialize(temp, condition, wspd, humidity, snow, location)

    @location = location
    new_city = @location.city
    @city = new_city.gsub(' ', '_')
    response = HTTParty.get("http://api.wunderground.com/api/ce0783e06625adc3/hourly/q/#{@location.state}/#{@city}.json")
    data = response.parsed_response
    @temp = data["hourly_forecast"][0]["temp"]["english"]
    @condition = data["hourly_forecast"][0]["condition"]
    @wspd = data["hourly_forecast"][0]["wspd"]["english"]
    @humidity = data["hourly_forecast"][0]["humidity"]
    @snow = data["hourly_forecast"][0]["snow"]["english"]
  end
end
