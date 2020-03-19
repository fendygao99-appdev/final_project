class ChangeOfferAcceptedToString < ActiveRecord::Migration[6.0]
  def change
    change_column :offers, :offer_accepted, :string
  end
end
