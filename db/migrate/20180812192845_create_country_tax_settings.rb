class CreateCountryTaxSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :country_tax_settings do |t|
      t.references :country, foreign_key: true
      t.references :currency, foreign_key: true
      t.integer :start_month

      t.timestamps
    end
  end
end
