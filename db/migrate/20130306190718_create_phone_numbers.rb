class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string   :number,                 null: false
      t.integer  :number_type,            null: false
      t.integer  :account_id,             null: false, default: 0
      t.string   :dnid,                   null: false, default: ""
      t.boolean  :ivr_enabled,            null: false, default: 0
      
      t.timestamps
    end
    add_index :phone_numbers, :account_id
  end
end