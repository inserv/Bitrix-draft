class ChangeCallTimeColumns < ActiveRecord::Migration
  def up
    rename_column :call_times, :greating_whrs, :greeting_whrs
    rename_column :call_times, :greating_afthrs, :greeting_afthrs
  end

  def down
    rename_column :call_times, :greeting_whrs, :greating_whrs
    rename_column :call_times, :greeting_afthrs, :greating_afthrs
  end
end
