require_relative 'nasa_data'
require_relative 'asteroid'

class NearEarthObjects
  def initialize(date)
    @date = date
    @asteroids_data = NASAData.asteroids(date)
    @asteroids = asteroids
  end

  def asteroids
    @asteroids_data.map do |asteroid_data|
      Asteroid.new(asteroid_data)
    end
  end

  def find_neos_by_date
    {
      asteroid_list: formatted_asteroid_data,
      biggest_asteroid: largest_asteroid_diameter,
      total_number_of_asteroids: total_number_of_asteroids
    }
  end

  def formatted_asteroid_data
    @asteroids.map do |asteroid|
      {
        name: asteroid.name,
        diameter: "#{asteroid.diameter} ft",
        miss_distance: "#{asteroid.miss_distance} miles"
      }
    end
  end

  def largest_asteroid_diameter
    @asteroids.max_by do |asteroid|
      asteroid.diameter
    end.diameter
  end

  def total_number_of_asteroids
    @asteroids.count
  end
end
