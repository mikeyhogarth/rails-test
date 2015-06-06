class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.datetime :date
      t.string :code
      t.decimal :value
      t.string :hashed_password

      t.timestamps
    end
  end
end
