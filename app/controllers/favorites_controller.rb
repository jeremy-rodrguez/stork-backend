class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :update]

  # GET /favorites
  def index
    @favorites = Favorite.all

    render json: @favorites
  end

  # GET /favorites/1
  def show
    render json: @favorite
  end

  # POST /favorites
  def create
    @favorite = Favorite.new(favorite_params)
  
    if @favorite.save
      user = User.find(favorite_params[:user_id])
      
      render json: user.items, status: :created
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /favorites/1
  def update
    if @favorite.update(favorite_params)
      render json: @favorite
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    favorite = Favorite.where(["user_id = ? and item_id = ?", favorite_params[:user_id], favorite_params[:item_id]])
    Favorite.destroy(favorite[0].id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_params
      params.require(:favorite).permit(:user_id, :item_id)
    end
end
