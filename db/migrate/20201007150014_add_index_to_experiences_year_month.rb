class AddIndexToExperiencesYearMonth < ActiveRecord::Migration[6.0]
  def change
    add_index :experiences, [ :year, :month ], unique: true
  end
end
