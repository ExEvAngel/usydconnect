class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user
	  t.integer :apost_id
      t.string  :apost_type
      
	  t.timestamps
    end
  end
end
