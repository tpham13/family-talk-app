class Api::V1::UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    # render json: @users
    users_json = UserSerializer.new(@users).serialized_json
    render json: users_json
  end

  # GET /users/1
  def show
    # render json: @user
    user_json = UserSerializer.new(@user).serialized_json
    render json: user_json
  end
 
  # POST /users
  def create
    @user = User.new(user_params)
    @group = Group.find_or_create_by(group_name: params[:user][:group][:group_name])
    @user.group = @group
    if @user.save
      session[:user_id] = @user.id
      render json: UserSerializer.new(@user), status: :created
    else
      resp = { 
        error: @user.errors.full_messages.to_sentence
       }
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :username, :password, :group)
    end
end
