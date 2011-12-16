class AddSourceCodeToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :source_code, :string
  end
end
