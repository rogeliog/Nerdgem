class AddImageAndGithubToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :github_profile, :string
  end
end
