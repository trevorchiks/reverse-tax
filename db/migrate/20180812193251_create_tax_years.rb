class CreateTaxYears < ActiveRecord::Migration[5.1]
  def change
    create_table :tax_years do |t|
      t.references :country, foreign_key: true
      t.integer :year
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
