class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
	  t.belongs_to :user
      t.belongs_to :athread
      t.string :body, :limit => 500, :null => false
      t.integer :no_flags, :default => 0
      t.integer :views, :default => 0
      t.datetime :date, :default => Time.now
	  
      t.timestamps
    end
  end
end
