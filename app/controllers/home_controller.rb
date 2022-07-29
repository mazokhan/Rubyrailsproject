class HomeController < ApplicationController
  def index
  end

  def search_weather
    data = client.current_weather(city: params[:city])
    respond_to do |format|
      format.js{
        @data = { city: data.name, time: data.dt, feel_like: data.main.feels_like,
          humidity: data.main.humidity, pressure: data.main.pressure,
          temperature: data.main.temp, max_temperature: data.main.temp_max,
          min_temperature: data.main.temp_min
        }
      }
    end
  end

  def current_loc
    data = client.current_weather(lat: loc_params[:lat], lon: loc_params[:lng])
    respond_to do |format|
      format.js{
        @data = { city: data.name, time: data.dt, feel_like: data.main.feels_like,
          humidity: data.main.humidity, pressure: data.main.pressure,
          temperature: data.main.temp, max_temperature: data.main.temp_max,
          min_temperature: data.main.temp_min
        }
      }
    end
  end

  def loc_params
    params.require(:location).permit(:lat,:lng)
  end

  def client
     OpenWeather::Client.new(api_key:"ec1dc69a0f01c62f761e2c155bf252a7")
  end
end
