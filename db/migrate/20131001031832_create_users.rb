class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :limit => 16, :null => false
      t.string :password, :limit => 16, :null => false
	  t.string :password_digest
      t.string :email, :limit => 40, :null => false
      t.boolean :is_staff, :default => false
      t.integer :xp, :default => 0
	  t.integer :no_thread, :default => 0
	  t.integer :no_comment, :default => 0
      t.boolean :is_banned, :default => false
      t.date :member_since, :default => Time.now

      t.timestamps
    end
  end
end
