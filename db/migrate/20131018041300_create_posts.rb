class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
	  t.belongs_to :athread
	  t.belongs_to :comment
	  
      t.timestamps
    end
  end
end
