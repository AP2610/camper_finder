class ChangePriceCentsToPrice < ActiveRecord::Migration[5.2]
  def change
    remove_column :vans, :price_cents
  end
end
