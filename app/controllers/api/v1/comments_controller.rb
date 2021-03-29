class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :get_post

  def index
      @comments = @post.comments
      render json: CommentSerializer.new(@comments) 
  end 
  
  # GET /comments/1
  def show
    render json: CommentSerializer.new(@comment)
  end

  def create
    @comment = current_user.comments.build(comments_params)

    if @comment.save
      render json:  CommentSerializer.new(@comment), status: :created
    else
      error_resp = {
        error: @comment.errors.full_messages.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end
  

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: CommentSerializer.new(@comment)
    else
      render json: CommentSerializer.new(@comment).errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end

    def get_post
      @post = Post.find(params[:post_id])
    end
end

