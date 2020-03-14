# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  # Direct Associations
  # A user has many furniture listings
  has_many :furnitures, :foreign_key => "owner_id", :dependent => :destroy

  # A user has many likes
  has_many :furniture_likes, :class_name => "Like", :foreign_key => "furniture_watcher_id", :dependent => :destroy

  # A user has many sent offers
  has_many :furniture_buy_offers, :class_name => "Offer", :foreign_key => "furniture_buyer_id", :dependent => :destroy
 
  # Indirect Associations
  # A user's liked furnitures on their wishlist
  has_many :liked_furnitures, :through => :furniture_likes, :source => :furniture

  # A user has many furnitures they've attempted to buy
  has_many :purchase_attempted_furnitures, :through => :furniture_buy_offers, :source => :furniture

end
