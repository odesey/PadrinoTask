# Tasks Assignment

We're going to create a Padrino application that models a TODO list. 

# INSTALL 

* Fork this repository and git clone it as normal.
* Generate a padrino project called task_assignment using ActiveRecord, ERB and shoulda.
* Generate a controller called Tasks, which can do the following things:

| HTTP Verb | Action |
|:----------|:-----------|
| GET       | :index |
| POST      | :index |
| PUT       | :index |
| DELETE    | :index |
| GET       | :show  |
| GET       | :edit  |
| GET       | :new   |

* Generate a model called Task, which has a title of class String.
* Create your databases using ```padrino rake ar:create:all```
* Create your database tables using ```padrino rake ar:migrate```
* Run it again in test mode: ```RACK_ENV=test padrino rake ar:migrate```

* Add the database cleaner gem, run bundle and add the following code to your controller blocks:
like this

    setup do
        DatabaseCleaner.strategy = :truncation
        DatabaseCleaner.start
    end
    
and
    
    teardown do
        DatabaseCleaner.clean
    end

* Disable the security settings for protection and CSRF in the config/apps.rb file.

# TODO - Don't forget to git commit after each of these!

* Add tests to your controller to ensure that you can perform basic CRUD operations on your Tasks. Use the example from today's lab for an example on what you can test.
* Add code to your controller to make your tests pass. You should be able to perform all CRUD operations using the controller without running the server!
* Let's add some features to our Task. WITHOUT destroying your model, add a field called "Description", and update your views to use a <textarea> element to capture the description. HINT: Use a new migration. Update your controllers to include the new attribute.
* Add a priority, an integer field: 1 means most important. Update your controllers and views.
* Change your index view to order the tasks by priorty. Lookup the .order method in ActiveRecord for tips on how to do this.
* Add checkboxes by each task, and add the ability to delete the tasks that are checked
* Pretty it up using CSS/HTML. How about making priority 1 tasks in red, or some other colour format?
