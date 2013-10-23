class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :name, :limit => 30, :null => false
      t.string :description, :limit => 500, :null => false
	  t.integer :condition, :null => false
	  t.string :badge, :limit => 300
	  
      t.timestamps
    end
  end
end
