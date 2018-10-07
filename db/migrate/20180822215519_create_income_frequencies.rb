class CreateIncomeFrequencies < ActiveRecord::Migration[5.1]
  def change
    drop table :income_frequencies
    create_table :income_frequencies do |t|
      t.string :name
      t.integer :count_per_year
      t.integer :order

      t.timestamps
    end
    add_index :income_frequencies, :name, unique: true
  end
end
