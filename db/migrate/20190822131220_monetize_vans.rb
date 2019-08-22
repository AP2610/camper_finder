class MonetizeVans < ActiveRecord::Migration[5.2]
  def change
    add_monetize :vans, :price, currency: { present: false }
  end
end
