class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  

  # GET /groups
  def index
    if logged_in? 
      @posts = current_user.group.posts
      render json: PostSerializer.new(@posts)
    else 
      render json: { 
        error: "You must be logged in to see posts"
       }
    end 
   
  end


  # GET /groups/1
  def show
    render json: PostSerializer.new(@post)
    # render json: @post

  end

  # POST /posts

  def create
    # byebug
    # built automatically associate the obj id from the left as the corsresponding id 
    @post = current_user.posts.build(post_params)

    if @post.save
      render json:  PostSerializer.new(@post), status: :created
    else
      error_resp = {
        error: @post.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  def update 

    if @post.update(post_params)
      render json:  PostSerializer.new(@post), status: :ok
    else
      error_resp = {
        error: @post.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end 

  def destroy
    # byebug
    if @post.destroy 
      render json: {data: "Trip successfully destroyed"}, status: :ok

    else
      
      error_resp = { 
        error: "Post not found and destroyed"
       }
      render json: error_resp, status: :unprocessable_entity
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      # deleted :use_id in permit params b/c I use build method to associate current_user 
      # when creating a new post in create method
      params.require(:post).permit(:content)
    end

end
