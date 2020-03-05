require 'test_helper'

class PlanetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @planet = planets(:one)
  end

  test "should get index" do
    get planets_url
    assert_response :success
  end

  test "should get new" do
    get new_planet_url
    assert_response :success
  end

  test "should create planet" do
    assert_difference('Planet.count') do
      post planets_url, params: { planet: { discovery_telescope: @planet.discovery_telescope, distance: @planet.distance, last_update: @planet.last_update, loc_rowid: @planet.loc_rowid, number_of_moons: @planet.number_of_moons, pl_hostname: @planet.pl_hostname, pl_mass: @planet.pl_mass, pl_name: @planet.pl_name, pl_orbital_eccentricity: @planet.pl_orbital_eccentricity, pl_orbital_period: @planet.pl_orbital_period, pl_radius: @planet.pl_radius, year_of_discovery: @planet.year_of_discovery } }
    end

    assert_redirected_to planet_url(Planet.last)
  end

  test "should show planet" do
    get planet_url(@planet)
    assert_response :success
  end

  test "should get edit" do
    get edit_planet_url(@planet)
    assert_response :success
  end

  test "should update planet" do
    patch planet_url(@planet), params: { planet: { discovery_telescope: @planet.discovery_telescope, distance: @planet.distance, last_update: @planet.last_update, loc_rowid: @planet.loc_rowid, number_of_moons: @planet.number_of_moons, pl_hostname: @planet.pl_hostname, pl_mass: @planet.pl_mass, pl_name: @planet.pl_name, pl_orbital_eccentricity: @planet.pl_orbital_eccentricity, pl_orbital_period: @planet.pl_orbital_period, pl_radius: @planet.pl_radius, year_of_discovery: @planet.year_of_discovery } }
    assert_redirected_to planet_url(@planet)
  end

  test "should destroy planet" do
    assert_difference('Planet.count', -1) do
      delete planet_url(@planet)
    end

    assert_redirected_to planets_url
  end
end
