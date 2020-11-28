require 'faraday'
require 'figaro'

# Load ENV vars via Figaro
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

class NASAData
  def self.connect(date)
    Faraday.new(
      url: 'https://api.nasa.gov',
      params: { start_date: date, api_key: ENV['nasa_api_key']}
    )
  end

  def self.asteroids(date)
    result = connect(date).get('/neo/rest/v1/feed')
    JSON.parse(result.body, symbolize_names: true)[:near_earth_objects][:"#{date}"]
  end
end
