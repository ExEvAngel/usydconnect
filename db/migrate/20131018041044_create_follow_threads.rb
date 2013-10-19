class CreateFollowThreads < ActiveRecord::Migration
  def change
    create_table :follow_threads do |t|
      t.belongs_to :user
	  t.belongs_to :athread
	  
      t.timestamps
    end
  end
end
