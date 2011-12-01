class ChangeAuthenticationsUidToInteger < ActiveRecord::Migration
  change_table :authentications do |t|
    t.change :uid, :integer
  end
end
