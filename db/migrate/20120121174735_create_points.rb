class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :user_id
      t.integer :tutorial_id

      t.timestamps
    end
  end
end
