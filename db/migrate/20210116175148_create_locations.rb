class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
	   t.column :user_id, :integer
         t.column :lat, :float
         t.column :lng, :float	
	   t.column :add, :string	 
    end
  end
end
