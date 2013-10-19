class CreateThreadTags < ActiveRecord::Migration
  def change
    create_table :thread_tags do |t|
      t.belongs_to :athread
	  t.belongs_to :tag
	  
      t.timestamps
    end
  end
end
