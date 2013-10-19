class CreateModerators < ActiveRecord::Migration
  def change
    create_table :moderators do |t|
      t.belongs_to :user
	  t.date :moderator_since, :default => Time.now
	  
      t.timestamps
    end
  end
end
