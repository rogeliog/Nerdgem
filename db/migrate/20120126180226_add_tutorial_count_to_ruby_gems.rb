class AddTutorialCountToRubyGems < ActiveRecord::Migration
  def change
    add_column :ruby_gems, :tutorials_count, :integer, default: 0
  end
end
