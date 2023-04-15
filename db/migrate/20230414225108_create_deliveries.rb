class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postcode,null:false
      t.integer :provice_id,null:false
      t.string :locality,null:false
      t.string :block,null:false
      t.string :apartment
      t.string :telephone_number,null:false
      t.references :purchase,null:false,foreign_key:true
      
      t.timestamps
    end
  end
end
