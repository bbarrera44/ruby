class RenameColumTariff < ActiveRecord::Migration[5.2]
  def up
    rename_column :tickets, :tariff, :tariff_id
  end
  def down
    rename_column :tickets, :tariff_id, :tariff
  end
end
