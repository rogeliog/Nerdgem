class AddEstimatedTimeToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :estimated_time, :string
  end
end
