class RemoveYearFromExperiences < ActiveRecord::Migration[6.0]
  def change
    remove_column :experiences, :year, :integer
    remove_column :experiences, :month, :integer
  end
end