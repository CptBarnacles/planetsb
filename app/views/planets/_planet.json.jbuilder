json.extract! planet, :id, :loc_rowid, :pl_name, :pl_hostname, :pl_orbital_period, :pl_orbital_eccentricity, :distance, :pl_mass, :pl_radius, :discovery_telescope, :number_of_moons, :year_of_discovery, :last_update, :created_at, :updated_at
json.url planet_url(planet, format: :json)
