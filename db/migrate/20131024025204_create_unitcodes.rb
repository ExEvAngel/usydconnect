class CreateUnitcodes < ActiveRecord::Migration
  def change
    create_table :unitcodes do |t|
      t.string :name, :limit => 16
	  
      t.timestamps
    end
  end
end
