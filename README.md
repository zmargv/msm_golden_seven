# Must See Movies Golden Seven

In this application, users will need to Create, Read, Update, and Delete the following resources:

#### Director

 - name (string)
 - bio (text)
 - dob (string)
 - image_url (string)

#### Actor

 - name (string)
 - bio (text)
 - dob (string)
 - image_url (string)

#### Movie

 - title (string)
 - year (integer)
 - duration (integer)
 - description (text)
 - image_url (string)

You will ultimately build something similar to [Photogram Golden Seven](http://photogram-golden-7.herokuapp.com/), but with different tables/columns.

Use the detailed instructions in the README of the `photogram_golden_seven` repository as a guide.

## Setup

 - First **fork**, and *then* clone.
 - Create **all three** models and databases table using `rails generate model ...` using the [Crud with Ruby Cheatsheet](https://guides.firstdraft.com/crud-with-ruby.html). For example,

        rails g model director name:string bio:text dob:string image_url:string
        rails g model actor name:string bio:text dob:string image_url:string
        rails g model movie title:string year:integer duration:integer description:text image_url:string

 - `rails db:migrate`
 - Add a few rows to each table through Rails Console. Or, alternatively, you can run `rails db:seed` from the command line, which will pre-populate ten rows in each table (I wrote a script to save you some typing). **(You need to create all three tables with exactly the column names above in order for this to work.)**

### READ

 - Build a way to see a list of all rows in the table, e.g., by visiting [http://localhost:3000/directors](http://localhost:3000/directors)
 - Build a way to see the details of an individual row, e.g., by visiting [http://localhost:3000/directors/4](http://localhost:3000/directors/4)

### DELETE

 - Build a way to delete an individual row, e.g., by visiting [http://localhost:3000/delete_director/4](http://localhost:3000/delete_director/4)
 - Add links to the index page and show pages to make it easier to visit these URLs.

### CREATE

 - Build a way to see a blank form to add a new row, e.g., by visiting [http://localhost:3000/directors/new_form](http://localhost:3000/directors/new_form)
 - Build the complementary action to receive inputs from that form and actually save them into a new row.

### UPDATE

 - Build a way to see a pre-populated form to edit an existing row, e.g., by visiting [http://localhost:3000/directors/4/edit_form](http://localhost:3000/directors/4/edit_form)
 - Build the complementary action to receive inputs from that form and actually update the existing row with them.
 - **Note:** If you run into an error that talks about "URI too long", that's because the bio is too long to fit in the query string. This is not an error for you to worry about; we'll talk about how to fix it next time. For now, just shorten the bio and re-submit the form.

---

Rinse and repeat for the other two tables, actors and movies. Good luck, ask lots of questions!
