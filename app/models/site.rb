class Site < ActiveRecord::Base
  has_many :proposals
  has_many :comments
end
