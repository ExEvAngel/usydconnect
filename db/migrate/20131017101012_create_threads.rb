class CreateThreads < ActiveRecord::Migration
  def change
    create_table :threads do |t|
      t.integer :user_id, :null => false
      t.string :title, :limit => 200, :null => false
      t.string :body, :limit => 500, :null => false
      t.boolean :is_closed, :default => false
      t.integer :no_flags, :default => 0
      t.integer :views, :default => 0
      t.datetime :Date, :default => Time.now
	  
      t.timestamps
    end
  end
end
