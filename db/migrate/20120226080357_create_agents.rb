class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.integer :code
      t.references :admin

      t.timestamps
    end
    add_index :agents, :admin_id
  end
end
