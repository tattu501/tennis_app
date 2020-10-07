class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.integer :year
      t.integer :month
      t.text :explanation

      t.timestamps
    end
  end
end
