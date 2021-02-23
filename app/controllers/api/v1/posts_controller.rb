class Api::V1::PostsController < ApplicationController

      # GET /groups
  def index
    if logged_in? 
      @posts = current_user.posts

      render json: PostSerializer.new(@posts)
    else 
      render json: { 
        error: "You must be logged in to see posts"
       }
    end 
   
  end

  # def show
  #   sighting = Sighting.find_by(id: params[:id])
  #   options = {
  #     include: [:bird, :location]
  #   }
  #   render json: SightingSerializer.new(sighting, options)
  # end
  # def show
  #   sighting = Sighting.find_by(id: params[:id])
  #   render json: sighting.to_json(:include => {
  #     :bird => {:only => [:name, :species]},
  #     :location => {:only => [:latitude, :longitude]}
  #   }, :except => [:updated_at])
  # end

  # GET /groups/1
  def show
    render json: PostSerializer.new(@post)
  end
end
