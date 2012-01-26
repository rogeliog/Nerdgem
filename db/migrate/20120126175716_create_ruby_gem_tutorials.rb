class CreateRubyGemTutorials < ActiveRecord::Migration
  def change
    create_table :ruby_gem_tutorials do |t|
      t.integer :tutorial_id
      t.integer :ruby_gem_id

      t.timestamps

    end
    add_index :ruby_gem_tutorials, [:ruby_gem_id, :tutorial_id]
  end
end
