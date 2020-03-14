class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.integer :furniture_id
      t.integer :furniture_buyer_id
      t.integer :offer_amount
      t.boolean :offer_accepted

      t.timestamps
    end
  end
end
