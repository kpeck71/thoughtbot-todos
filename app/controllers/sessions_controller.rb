class SessionsController < ApplicationController
  def new
  end

  def create
    session[:current_email] = params[:session][:email]
    redirect_to new_todo_path
  end
end
