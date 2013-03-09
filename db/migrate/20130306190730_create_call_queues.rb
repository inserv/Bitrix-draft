class CreateCallQueues < ActiveRecord::Migration
  def change
    create_table :call_queues do |t|
      t.integer  :phone_number_id,         null: false
      t.integer  :group_id,                null: false
      t.string   :music_on_hold,           null: false, default: ""
      t.boolean  :place_inform,            null: false, default: 0 

      t.timestamps
    end
    add_index :call_queues, :phone_number_id
    add_index :call_queues, :group_id
  end
end