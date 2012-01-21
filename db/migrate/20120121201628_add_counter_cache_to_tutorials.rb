class AddCounterCacheToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :points_count, :integer, default: 0
  end
end
