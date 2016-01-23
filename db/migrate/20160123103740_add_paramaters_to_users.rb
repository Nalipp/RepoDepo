class AddParamatersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :description, :text
    add_column :users, :github, :string
    add_column :users, :website, :string
  end
end
