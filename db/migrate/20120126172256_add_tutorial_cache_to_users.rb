class AddTutorialCacheToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tutorials_count, :integer, default: 0
    User.reset_column_information
    User.all.each do |u|
      User.update_counters u.id, tutorials_count: u.tutorials.length
    end
  end
end
