require 'csv'
require 'faker'
namespace :planets do
  desc "return planet information from CSV"
  task seed_planets: :environment do

    Sponsor.destroy_all
    Planet.destroy_all
    User.destroy_all
    
	
    CSV.foreach("lib/assets/planets_file.csv", :headers =>true) do |row |
      puts row[2].inspect 

      #create new model from the csv 
      Planet.create!(
      loc_rowid: row[0].to_i,
      pl_name: row[2].to_s,
      pl_hostname: row[1].to_s,
      pl_orbital_period: row[4].to_f,
      pl_orbital_eccentricity: row[8].to_f,
      distance: row[17].to_f,
      pl_mass: row[25].to_f,
      pl_radius: row[29].to_f,
      discovery_telescope: row[33].to_s,
      number_of_moons: row[34].to_i,
      year_of_discovery: row[35].to_s,
      last_update: row[36].to_s
      )
    end

    


  end
end

#:loc_rowid, :pl_name, :pl_hostname, :pl_orbital_period, 
#:pl_orbital_eccentricity, :distance, :pl_mass, :pl_radius, 
#:discovery_telescope, :number_of_moons, :year_of_discovery, :last_update

