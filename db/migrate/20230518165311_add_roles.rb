class AddRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :title

      t.timestamps
    end

    create_table :comments do |t|
      t.references :user, null: false
      t.references :post, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
