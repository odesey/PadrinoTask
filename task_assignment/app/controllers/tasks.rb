TaskAssignment::App.controllers :tasks do
  
  
  get :index do
    @tasks = Task.all
    render '/tasks/index'
  end

  post :index do
    p = Task.new(:title => params[:title])
    p.save
    redirect "/tasks/show/#{p.id}"
  end

  put :index, :with => :id do
    @task = Task.find(params[:title])
    @task.title = params[:title]
    @task.save
    render"/tasks/show/#{@task.id}"
  end

  delete :destroy, :with => :id  do
    @Task = Task.find(params[:id])
    @Task.destroy
    redirect '/tasks'
  end

  get :show, :with => :id do
    @tasks = Task.find(params[:id])
    render '/tasks/show'
  end

  get :edit, :with => :id do
    @task = Task.find(params[:id])
    render '/tasks/edit'
  end

  get :new do
    render '/tasks/new'
  end

end
