class CreateDraftThreads < ActiveRecord::Migration
  def change
    create_table :draft_threads do |t|
      t.belongs_to :user
      t.string :title, :limit => 200
      t.string :body, :limit => 1000
      t.datetime :saved_at
	  
      t.timestamps
    end
  end
end
