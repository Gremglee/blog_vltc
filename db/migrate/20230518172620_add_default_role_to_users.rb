class AddDefaultRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :role, index: true, default: 3
  end
end
