require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')
class TasksControllerTest < Test::Unit::TestCase
  context "TasksController" do
    setup do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.start
      @task = Task.new(:title => "Get Crackin")
      @task.save
      # binding.pry
    end
    
      should "return all Tasks when we visit /tasks" do
      get '/tasks'
      assert last_response.ok?
      assert last_response.body.include?("Get Crackin")
    end
 
    # should "return the Product when we visit /tasks/show/1" do
    #   get '/tasks/show/1'
    #   assert last_response.ok?
    #   assert last_response.body.include?("Get Crackin")
    # end
 
    # should "show me a form to create a product when we visit /products/new" do
    #   get '/products/new'
    #   assert last_response.ok?
    #   assert last_response.body.include?("Create new product")
    # end
 
    # should "show me the new Product and save it to the database" do
    #   post '/products/create', { :title => "Pogo stick"}
    #   follow_redirect!
    #   assert_equal "/products/show/2", last_request.path
    #   assert_equal 2, Product.count
    # end
 
    # should "show me a form to edit a product when we visit /products/show/1/edit" do
    #   get '/products/edit/1'
    #   assert last_response.ok?
    #   assert last_response.body.include?("Edit Chocolate Teapot")
    # end
 
    # should "update the existing record to be called Magic Beans" do
    #   put '/products/update/1'
    #   follow_redirect!
    #   assert_equal "/products/show/1", last_request.path
    #   assert_equal 1, Product.count
    # end
 
    # should "delete the existing record" do
    #   delete '/products/destroy/1'
    #   follow_redirect!
    #   assert_equal "/products", last_request.path
    #   assert_equal 0, Product.count
    #   # binding.pry
    # end
    teardown do
    	DatabaseCleaner.clean
    end
  end
end