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
  end

  # POST /posts

  def create
    # byebug
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:content)
    end

end
