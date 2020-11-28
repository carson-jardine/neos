class Asteroid
  attr_reader :name, :diameter, :miss_distance

  def initialize(attributes)
    @name = attributes[:name]
    @diameter = attributes[:estimated_diameter][:feet][:estimated_diameter_max].to_i
    @miss_distance = attributes[:close_approach_data][0][:miss_distance][:miles].to_i
  end
end
