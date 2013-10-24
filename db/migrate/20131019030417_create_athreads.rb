class CreateAthreads < ActiveRecord::Migration
  def change
    create_table :athreads do |t|
      t.belongs_to :user
      t.string :title, :limit => 200, :null => false
      t.string :body, :limit => 1000, :null => false
      t.boolean :is_closed, :default => false
      t.integer :no_flags, :default => 0
      t.integer :views, :default => 0
      t.datetime :Date
	
      t.timestamps
    end
  end
end
