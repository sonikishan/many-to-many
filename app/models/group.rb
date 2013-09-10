=begin
  Represents a Group that a User can belong to in our fictional system.
=end
class Group < ActiveRecord::Base
  attr_accessible :name

  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships
end
