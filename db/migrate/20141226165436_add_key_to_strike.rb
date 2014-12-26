class AddKeyToStrike < ActiveRecord::Migration
  def change
    add_column :strikes, :key, :string
  end
end
