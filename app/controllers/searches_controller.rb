class SearchesController < ApplicationController

  def index
    @searches = Search.all
  end

  def show
    @search = Search.find(params[:id])
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new
    @search.origin = params[:origin]
    @search.destination = params[:destination]
    @search.duration = params[:duration]
    @search.origin_return = params[:origin_return]
    @search.destination_return = params[:destination_return]
    @search.duration_return = params[:duration_return]
    @search.price = params[:price]
    @search.carrier = params[:carrier]
    @search.flight_no = params[:flight_no]
    @search.carrier_return = params[:carrier_return]
    @search.flight_no_return = params[:flight_no_return]
    @search.departure_return_time = params[:departure_return_time]
    @search.departure_time = params[:departure_time]

    if @search.save
      redirect_to "/searches", :notice => "Search created successfully."
    else
      render 'new'
    end
  end

  def edit
    @search = Search.find(params[:id])
  end

  def update
    @search = Search.find(params[:id])

    @search.origin = params[:origin]
    @search.destination = params[:destination]
    @search.duration = params[:duration]
    @search.origin_return = params[:origin_return]
    @search.destination_return = params[:destination_return]
    @search.duration_return = params[:duration_return]
    @search.price = params[:price]
    @search.carrier = params[:carrier]
    @search.flight_no = params[:flight_no]
    @search.carrier_return = params[:carrier_return]
    @search.flight_no_return = params[:flight_no_return]
    @search.departure_return_time = params[:departure_return_time]
    @search.departure_time = params[:departure_time]

    if @search.save
      redirect_to "/searches", :notice => "Search updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @search = Search.find(params[:id])

    @search.destroy

    redirect_to "/searches", :notice => "Search deleted."
  end
end
