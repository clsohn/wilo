class Message
  attr_accessor :weather

  def initialize(weather)
    @weather = weather
  end

  def temp
    if @weather.temp.to_i >= 85
      return "It's gonna get really hot today, wear shorts if you can"
    elsif @weather.temp.to_i > 70 && @weather.temp.to_i < 84
      return "It's pretty warm out"
    elsif @weather.temp.to_i > 45 && @weather.temp.to_i < 60
      return "It's a little chilly, wear layers"
    elsif @weather.temp.to_i > 20 && @weather.temp.to_i < 45
      return "It's so cold out, wear your jacket and bring gloves"
    elsif  @weather.temp.to_i <= 20
      return "It's freezing out! You're gonna need a hat, scarf and gloves"
    else
      return "It's pretty mild out actually, probably just need a light jacket"
    end
  end

  def wind
    if @weather.wspd.to_i > 25
      return "Also, it's gonna be windy"
    end
  end

  def rain
    if @weather.condition === "rain"
      return "You can't leave the house without an umbrella!"
    end
  end

  def humidity
    if @weather.humidity.to_i > 75
      return "It's really humid too"
    end
  end

  def snow
    if @weather.snow.to_i > 0 && @weather.snow.to_i < 4
      return "There's gonna be some snow, stay warm"
    elsif @weather.snow.to_i > 4 && @weather.snow.to_i < 8
      return "Snow day! Wear your boots and bundle up"
    elsif @weather.snow.to_i > 8
      return "Gonna be a lot of snow! Stock supplies and stay home!"
    else
      return ""
    end
  end
end
