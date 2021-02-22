class Api::V1::PostsController < ApplicationController

      # GET /groups
  def index
    if logged_in? 
      @posts = current_user.posts

      render json: @posts
    else 
      render json: { 
        error: "You must be logged in to see posts"
       }
    end 
   
  end

  # GET /groups/1
  def show
    render json: @posts
  end
end
