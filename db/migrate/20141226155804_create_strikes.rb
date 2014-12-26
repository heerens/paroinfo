class CreateStrikes < ActiveRecord::Migration
  def change
    create_table :strikes do |t|
      t.string :city
      t.string :category
      t.string :institution
      t.string :line
      t.string :description
      t.string :reporter
      t.datetime :started_at
      t.integer :expected_duration
      t.integer :confirmation_count
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
