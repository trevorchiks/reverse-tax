class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.string :symbol, limit: 1
      t.string :code, limit: 5
      t.string :name

      t.timestamps
    end
    add_index :currencies, :symbol, unique: true
    add_index :currencies, :code, unique: true
  end
end
