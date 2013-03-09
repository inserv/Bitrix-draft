class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer  :account_id,            null: false
      t.string   :group_name,            null: false, default: ""
      t.string   :group_type,            null: false, default: "parallel"
      t.integer  :ring_timeout,          null: false, default: 30

      t.timestamps
    end
    add_index :groups, :account_id
  end
end