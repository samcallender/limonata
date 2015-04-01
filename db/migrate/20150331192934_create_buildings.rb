class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
    	t.integer :building_id
    	t.string :building_name
    	t.string :city_name
    	t.integer :image_width
    	t.integer :image_height
    	t.integer :drawing_id
    	t.integer :city_id
    	t.integer :state_id
    	t.string :state_abbreviation
    	t.string :country_name
    	t.integer :status_id
    	t.string :status
    	t.integer :finished
    	t.integer :floors
    	t.string :building_use
    	t.float :antenna_height
    	t.float :spire_height
    	t.float :roof_height

      t.timestamps null: false
    end
  end
end
