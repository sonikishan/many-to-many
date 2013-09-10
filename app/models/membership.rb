=begin
  Represents a User -> Group association.  A User can belong to many Groups.  Consequently, a Group can have many
  Users.

  NOTE:  To support the "destroy" action, ActiveRecord needs the id column to be present in the join table (i.e. the
  memberships table, in this case).  Originally, I had ":id => false" in the membership table migration.  When I would
  run the "destroy" action, SQLite would report the following in the development log:

    # console - getting the user by ID.
    1.9.3p194 :001 > @user = User.find_by_id(4)
      User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."id" = 4 LIMIT 1
     => #<User id: 4, first_name: "Luke", last_name: "Skywalker", department: "Whiny Bitches", created_at: "2012-11-28 19:20:56", updated_at: "2012-11-28 19:20:56">

    # console - trying to delete the user.
    1.9.3p194 :002 > @user.destroy
       (0.1ms)  begin transaction
      Membership Load (0.1ms)  SELECT "memberships".* FROM "memberships" WHERE "memberships"."user_id" = 4
    Could not log "sql.active_record" event. NoMethodError: undefined method `name' for nil:NilClass
    SQLite3::SQLException: no such column: memberships.: DELETE FROM "memberships" WHERE "memberships"."" = ?
       (0.1ms)  rollback transaction
    ActiveRecord::StatementInvalid: SQLite3::SQLException: no such column: memberships.: # stack trace elided...

  I found this thread on StackOverflow, which solved my issue:

    http://stackoverflow.com/questions/5085258/cant-destroy-record-in-many-to-many-relationship
=end
class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
end
