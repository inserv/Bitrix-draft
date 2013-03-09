class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.integer  :group_id,                null: false    
      t.integer  :user_id,                 null: false
      t.integer  :group_priority,          null: false, default: 0

      t.timestamps
    end
    add_index :agents, :group_id
    add_index :agents, :user_id
  end
end
