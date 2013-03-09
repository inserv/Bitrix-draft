class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string   :name,                    null: false
      t.integer  :nat_number_count,        null: false, default: 1
      t.integer  :serv_number_count,       null: false, default: 2

      t.timestamps
    end
  end
end