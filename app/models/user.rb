=begin
  Represents a user in our fictional system.  Department is an optional field, but a User must have a first and last
  name.

  NOTE:  The "attr_accessible :group_ids" is the magic that allows the assignment of a User to a selection of Groups.
  This attribute is an array of IDs that represent the Groups that were checked in the Edit or New views.  When .save
  is called on the User, this array is shipped off to ActiveRecord, who knows what to do with it (i.e. INSERT or DELETE
  in the memberships table).

  I have a feeling that this really shouldn't be set as an "attr_accessible", but it works for now.
=end
class User < ActiveRecord::Base
  attr_accessible :department, :first_name, :last_name
  attr_accessible :group_ids

  has_many :memberships, :dependent => :destroy
  has_many :groups, :through => :memberships

  validates(:first_name,
            :presence => true,
            :uniqueness => { :case_sensitive => false },
            :length => { :maximum => 50 })

  validates(:last_name,
            :presence => true,
            :uniqueness => { :case_sensitive => false },
            :length => { :maximum => 50 })
end
