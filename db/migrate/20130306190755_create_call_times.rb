class CreateCallTimes < ActiveRecord::Migration
  def change
    create_table :call_times do |t|
      t.integer  :phone_number_id,        null: false
      t.string   :greating_whrs,          null: false, default: ""           
      t.string   :greating_afthrs,        null: false, default: ""  
      t.time     :mon_start1
      t.time     :mon_stop1
      t.time     :tues_start1
      t.time     :tues_stop1
      t.time     :wed_start1
      t.time     :wed_stop1
      t.time     :thu_start1
      t.time     :thu_stop1
      t.time     :fri_start1
      t.time     :fri_stop1
      t.time     :sat_start1
      t.time     :sat_stop1
      t.time     :sun_start1
      t.time     :sun_stop1
      t.time     :default_start1
      t.time     :default_stop1
      t.boolean  :default_override,       null: false, default: 0  

      t.timestamps
    end
    add_index :call_times, :phone_number_id
  end
end