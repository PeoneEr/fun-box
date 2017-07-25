class CreateFixedRates < ActiveRecord::Migration[5.0]
  def change
    create_table :fixed_rates do |t|
      t.float :value
      t.datetime :unfix_at

      t.timestamps
    end
  end
end
