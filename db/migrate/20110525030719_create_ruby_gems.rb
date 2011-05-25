class CreateRubyGems < ActiveRecord::Migration
  def self.up
    create_table :ruby_gems do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :ruby_gems
  end
end
