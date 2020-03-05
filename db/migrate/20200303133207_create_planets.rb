class CreatePlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|
      t.integer :loc_rowid
      t.string :pl_name
      t.string :pl_hostname
      t.float :pl_orbital_period
      t.float :pl_orbital_eccentricity
      t.float :distance
      t.float :pl_mass
      t.float :pl_radius
      t.string :discovery_telescope
      t.integer :number_of_moons
      t.string :year_of_discovery
      t.date :last_update

      t.timestamps
    end
  end
end
