many-to-many - How to Express a Many-to-Many Relationship Via Checkboxes
------------------------------------------------------------------------

A simple Rails 3.2 CRUD application that demonstrates how to use checkboxes on a form to persist many-to-many relationships.

The original idea of how to implement this technique came from [this article] [1].

Because I had to see it work for myself, I created this quick demo app.  The idea is that a User can belong to many Groups.  Consequently, a Group can have many Users.  The User -> Group relationship is expressed via a Memberships object, which maps a User to a Group.  Each Group is represented by a checkbox on the User screen.

Setup
-----
1.  Clone the app locally.
2.  Run ```rake db:migrate``` to set up the database.
3.  Run ```rake db:populate``` to seed the database with some sample data.
4.  Edit an existing User or Add a User.
5.  After saving, observe the "Groups" column on the index page will display a comma-separated list of the Groups that were selected.

[1]: http://millarian.com/programming/ruby-on-rails/quick-tip-has_many-through-checkboxes/
