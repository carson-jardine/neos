require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'JSON'

require_relative 'near_earth_objects'

class NearEarthObjectsTest < Minitest::Test
  def test_a_date_returns_a_list_of_neos
    #neo = NearEarthObjects.new('2019-03-30')
    # results = neo.find_neos_by_date
    results = NearEarthObjects.find_neos_by_date('2019-03-30')
    assert_equal '(2011 GE3)', results[:asteroid_list][0][:name]
  end
end
