class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
    @todos = Todo.all
  end

  def create
    Todo.create(todo_params)
    redirect_to new_todo_path
  end

  private
  def todo_params
    params.require(:todo).permit(:title)
  end
end
