class AddInfoToRubyGems < ActiveRecord::Migration
  def change
    add_column :ruby_gems, :info, :string
  end
end
