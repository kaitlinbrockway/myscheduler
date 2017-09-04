class AddRoleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :string, :default => 'guest', :null => false, :limit => 20    
  end
end
