class ChangeRubyGemInfoToText < ActiveRecord::Migration
  change_table :ruby_gems do |t|
    t.change :info, :text
  end
end
