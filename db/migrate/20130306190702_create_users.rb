class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :first_name,               null: false, default: ""
      t.string   :last_name,                null: false, default: ""
      t.string   :email,                    null: false, default: ""
      t.integer  :level,                    null: false, default: 0
      t.string   :phone,                    null: false, default: ""
      t.integer  :account_id,               null: false, default: 0
      
      t.string   :login,                    null: false
      t.string   :persistence_token,        null: false
      t.string   :crypted_password,         null: false
      t.string   :password_salt,            null: false
      t.integer  :login_count,              null: false, default: 0
      t.integer  :failed_login_count,       null: false, default: 0
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string   :current_login_ip
      t.string   :last_login_ip

      t.timestamps
    end
    add_index :users, :account_id
  end
end