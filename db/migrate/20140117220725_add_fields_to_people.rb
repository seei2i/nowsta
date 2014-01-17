class AddFieldsToPeople < ActiveRecord::Migration
  def change
  	 add_column :people, :user_id, :integer
  	 add_column :people, :status, :string
  end
end
