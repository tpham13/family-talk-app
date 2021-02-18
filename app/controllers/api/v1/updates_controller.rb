class Api::V1::UpdatesController < ApplicationController

      # GET /groups
  def index
    @updates = Update.all

    render json: @updates
  end

  # GET /groups/1
  def show
    render json: @update
  end
end
