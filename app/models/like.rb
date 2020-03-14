# == Schema Information
#
# Table name: likes
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  furniture_id         :integer
#  furniture_watcher_id :integer
#

class Like < ApplicationRecord
  # Direct Associations
  # The liker user
  belongs_to :furniture_watcher, :class_name => "User"

  # The liked furniture item
  belongs_to :furniture
end
