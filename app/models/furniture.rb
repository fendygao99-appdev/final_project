# == Schema Information
#
# Table name: furnitures
#
#  id             :integer          not null, primary key
#  category       :string
#  condition      :string
#  image          :string
#  is_available   :boolean
#  item           :string
#  original_brand :string
#  price          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Furniture < ApplicationRecord

  # Direct Associations
  # A furniture's owner
  belongs_to :owner, :class_name => "User"

  # A furniture's likes
  has_many :likes, :dependent => :destroy

  # A furniture's offers
  has_many :offers, :dependent => :destroy

  # Indirect Associations
  # The users that liked a funiture item
  has_many :furniture_watchers, :through => :likes, :source => :furniture_watcher

  # The users that made offers on a furniture item
  has_many :furniture_buyers, :through => :offers, :source => :furniture_buyer
end
