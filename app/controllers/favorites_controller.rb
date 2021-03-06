class FavoritesController < ApplicationController

  def check_if_owner
    favorite = Favorite.find(params[:id])
    if favorite.user_id != current_user.id
      redirect_to "/favorites", notice: "Can only view your favorites"
    end
  end

  def index
    @favorites = Favorite.all
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.destination_id = params[:destination_id]
    @favorite.carrier_id = params[:carrier_id]

    if @favorite.save
      redirect_to "/favorites", :notice => "Favorite created successfully."
    else
      render 'new'
    end
  end

  def edit
    @favorite = Favorite.find(params[:id])
  end

  def update
    @favorite = Favorite.find(params[:id])

    @favorite.user_id = current_user.id
    @favorite.destination_id = params[:destination_id]
    @favorite.carrier_id = params[:carrier_id]

    if @favorite.save
      redirect_to "/favorites", :notice => "Favorite updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])

    @favorite.destroy

    redirect_to "/favorites", :notice => "Route deleted."
  end
end
