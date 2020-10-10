class RemoveNoTitleFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :no_title, :boolean
  end
end
