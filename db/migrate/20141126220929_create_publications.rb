class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :version, { null: false } 
      t.string :title, { limit: 200 , null:false }
      t.text  :subtitle
      t.string :address, { limit:100 , null:false }
      t.integer :type_of_collecting
      t.decimal :latitude, { null:false } 
      t.decimal :longitude, { null:false }
      t.decimal :starting_date
      t.decimal :ending_date, { null:false }
      t.string :contact_info, { limit:100 , null:false }
      t.boolean :is_on_air
      t.string :active_device_dev_uuid, { limit:64 , null:false }
      t.string :photo_url

      t.timestamps
    end
end
