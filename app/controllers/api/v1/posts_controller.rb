class Api::V1::PostsController < ApplicationController

      # GET /groups
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /groups/1
  def show
    render json: @posts
  end
end
