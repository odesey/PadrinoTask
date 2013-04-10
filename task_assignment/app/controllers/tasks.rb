TaskAssignment::App.controllers :tasks do
  
  
  get :index do
    @tasks = Task.all
    render '/tasks/index'
  end

  post :index do
    p = Task.new(:title => params[:title])
    p.save
    redirect "/products/show/#{p.title}"
  end

  put :index, :with => :title do
    @task = Task.find(params[:title])
    @task.title = params[:title]
    @task.save
    redirect "/tasks/show/#{@task.title}"
  end

  delete :destroy, :with => :id  do
    @Task = Task.find(params[:id])
    @Task.destroy
    redirect '/tasks'
  end

  get :show, :with => :title do
    @tasks = Task.find(params[:title])
    render '/tasks/show'
  end

  get :edit, :with => :title do
    @task = Task.find(params[:title])
    render '/tasks/edit'
  end

  get :new do
    render '/tasks/new'
  end

end
