namespace :db do
  desc "Fill the database with sample data for testing"
  task populate: :environment do

    Rake::Task["db:reset"].invoke

    make_users
    make_groups
    make_memberships
  end
end

def make_users
  User.create!(:first_name => "Darth", :last_name => "Vader", :department => "Sith Lords")
  User.create!(:first_name => "Emperor", :last_name => "Palpatine", :department => "Grand Poobahs")
  User.create!(:first_name => "Han", :last_name => "Solo", :department => "Smugglers")
end

def make_groups
  Group.create!(:name => "Empire")
  Group.create!(:name => "Alliance")
  Group.create!(:name => "Independent")
  Group.create!(:name => "Green Party")
end

def make_memberships
  first_membership = Membership.new
  first_membership.user_id = User.first.id
  first_membership.group_id = Group.first.id
  first_membership.save

  second_membership = Membership.new
  second_membership.user_id = User.last.id
  second_membership.group_id = Group.last.id
  second_membership.save
end