class Weather
  attr_accessor :hour, :temp, :condition, :wspd, :humidity, :snow

  def initialize(hour, temp, condition, wspd, humidity, snow)
    @hour = hour
    @temp = temp
    @condition = condition
    @wspd = wspd
    @humidity = humidity
    @snow = snow
  end

  def times
    users.commute_one_start
  end

  def location

  end

  # # def fetch
  #   body = fetch('http://api.wunderground.com/api/ce0783e06625adc3/hourly/q/MA/Boston.json')
  #   binding.pry
  # #     .then(response => {
  #       if (response.ok) {
  #         return response;
  #       } else {
  #         let errorMessage = `${response.status} (${response.statusText})`,
  #             error = new Error(errorMessage);
  #         throw(error);
  #       }
  #     })
  #     .then(response => response.json())
  #     .then(body => {
  #       console.log(body);
  #       @hour = body.hourly_forecast[0].FCTTIME.hour;
  #       @temp = body.hourly_forecast[0].temp.english;
  #       @condition = body.hourly_forecast[0].condition;
  #       @wspd = body.hourly_forecast[0].wspd.english;
  #       @humidity = body.hourly_forecast[0].humidity;
  #       @snow = body.hourly_forecast[0].snow.english;
  #       })
  #     .catch(error => console.error(`Error in fetch: ${error.message}`));
  # end
end
