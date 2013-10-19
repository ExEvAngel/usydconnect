class CreateFollowUsers < ActiveRecord::Migration
  def change
    create_table :follow_users do |t|
      t.belongs_to :user
	  t.belongs_to :second_user
	  
      t.timestamps
    end
  end
end
