class Message
  attr_accessor :weather

  def initialize(weather)
    @weather = weather
  end

  def heat
    if @weather.temp.to_i >= 85
      return "It's gonna get really hot today, wear shorts if you can"
    end
  end

  def middle
    if @weather.temp.to_i > 20 && @weather.temp.to_i < 85
       return "Not much to say here"
    end
  end

  def cold
    if  @weather.temp.to_i <= 20
      return "It's freezing out! You're gonna need a hat, scarf and gloves"
    end
  end

  def wind
    if @weather.wspd.to_i > 25
      return "Just so you know, it's gonna be pretty windy"
    end
  end

  def rain
    if @weather.condition === "rain"
      return "You can't leave the house without an umbrella!"
    end
  end

  def flurries
    if @weather.snow.to_i > 0 && @weather.snow.to_i < 4
      return "There's gonna be some snow, stay warm"
    end
  end

  def snow
    if @weather.snow.to_i > 4 && @weather.snow.to_i < 8
      return "Snow day! Wear your boots and bundle up"
    end
  end

  def blizzard
    if @weather.snow.to_i > 8
      return "Gonna be a lot of snow! Stock supplies and stay home!"
    end
  end
end
