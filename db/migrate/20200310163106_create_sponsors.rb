class CreateSponsors < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.references :user, foreign_key: true
      t.references :planet, foreign_key: true

      t.timestamps
    end
  end
end
