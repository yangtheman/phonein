class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :phone
      t.references :admin

      t.timestamps
    end
    add_index :clients, :admin_id
  end
end
