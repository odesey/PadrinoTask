require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')
class TasksControllerTest < Test::Unit::TestCase
  context "TasksController" do
    setup do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.start
      @task = Task.new(:title => "Get Crackin")
      @task.save
    end

      should "return all Tasks when we visit /tasks" do
      get '/tasks'
      assert last_response.ok?
      assert last_response.body.include?("Get Crackin")
    end
 
      should "return the task when we visit /tasks/show/1" do
      get '/tasks/show/1'
      assert last_response.ok?
      assert last_response.body.include?("Get Crackin")
    end
 
     should "show me a form to create a task when we visit /tasks/new" do
      get '/tasks/new'
      assert last_response.ok?
      assert last_response.body.include?("Create new task")
    end
 
      should "show me the new Task and save it to the database" do
      post '/tasks/new', { :title => "Pogo stick"}
      follow_redirect!
      assert_equal "/tasks/show/2", last_request.path
      assert_equal 2, Task.count
    end
 
    should "show me a form to edit a task when we visit /tasks/edit/1" do
      get '/tasks/edit/1'
      assert last_response.ok?
      assert last_response.body.include?("Edit Get Crackin")
    end
 
    # should "update the existing record to be called Magic Beans" do
    #   put '/products/update/1'
    #   follow_redirect!
    #   assert_equal "/products/show/1", last_request.path
    #   assert_equal 1, Product.count
    # end
 
    should "delete the existing record" do
      delete '/tasks/destroy/1'
      follow_redirect!
      assert_equal "/tasks", last_request.path
      assert_equal 0, Task.count
    end
    
    teardown do
    	DatabaseCleaner.clean
    end
  end
end