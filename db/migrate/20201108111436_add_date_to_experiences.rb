class AddDateToExperiences < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :date, :date
  end
end
