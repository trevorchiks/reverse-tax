class CreateTaxYearDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :tax_year_details do |t|
      t.references :tax_year, foreign_key: true
      t.decimal :marginal_rate
      t.decimal :bracket_start

      t.timestamps
    end
  end
end
