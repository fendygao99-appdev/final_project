# == Schema Information
#
# Table name: offers
#
#  id                 :integer          not null, primary key
#  offer_accepted     :boolean
#  offer_amount       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  furniture_buyer_id :integer
#  furniture_id       :integer
#

class Offer < ApplicationRecord
  # Direct Associations
  # The user that made the offer
  belongs_to :furniture_buyer, :class_name => "User"

  # The furniture item the offer was made for
  belongs_to :furniture
end
