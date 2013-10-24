class CreateThreadUnitcodes < ActiveRecord::Migration
  def change
    create_table :thread_unitcodes do |t|
      t.belongs_to :athread
	  t.belongs_to :unitcode
	  
      t.timestamps
    end
  end
end
