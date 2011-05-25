class RubyGemsTutorials < ActiveRecord::Migration
  def self.up
    create_table :ruby_gems_tutorials, :id => false do |t|
      t.integer :tutorial_id
      t.integer :ruby_gem_id
    end
    
    add_index :ruby_gems_tutorials, [:ruby_gem_id, :tutorial_id]
  end

  def self.down
    drop_table :ruby_gems_tutorials
  end
end
