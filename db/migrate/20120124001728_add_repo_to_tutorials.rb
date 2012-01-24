class AddRepoToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :repo_link, :string
  end
end
