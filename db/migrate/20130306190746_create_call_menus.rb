class CreateCallMenus < ActiveRecord::Migration
  def change
    create_table :call_menus do |t|
      t.integer  :phone_number_id,        null: false
      t.string   :menu_message,           null: false, default: ""
      t.integer  :menu_key1,              null: false, default: 0
      t.integer  :menu_key2,              null: false, default: 0
      t.integer  :menu_key3,              null: false, default: 0

      t.timestamps
    end
    add_index :call_menus, :phone_number_id
  end
end