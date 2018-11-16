class TodosController < ApplicationController
  before_action :authenticate

  def index
    @todos = Todo.where(email: session[:current_email])
  end

  def new
    @todo = Todo.new
    @todos = Todo.where(email: session[:current_email])
  end

  def create
      Todo.create(todo_params.merge(email: session[:current_email]))
      redirect_to new_todo_path
    # if !params[:email].current_user?
    #   redirect_to new_session_path
    # else
    #   Todo.create(todo_params)
    #   redirect_to new_todo_path
    # end
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :email)
  end
end
