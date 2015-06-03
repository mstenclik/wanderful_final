class SearchesController < ApplicationController

  def index
    @searches = Search.all

    today = DateTime.now
    three_weeks = today + 3.weeks

    if three_weeks.strftime("%u").to_i <= 5
      friday = three_weeks + (5 - three_weeks.strftime("%u").to_i).days
    elsif three_weeks.strftime("%u").to_i == 6
      friday = three_weeks + 6
    else
      friday = three_weeks + 5
    end

    @friday_formatted = friday.strftime("%-m/%-d")

    if three_weeks.strftime("%u").to_i <= 5
      sunday = three_weeks + (7 - three_weeks.strftime("%u").to_i).days
    elsif three_weeks.strftime("%u").to_i == 6
      sunday = three_weeks + 8
    else
      sunday = three_weeks + 7
    end

    @sunday_formatted = sunday.strftime("%-m/%-d")

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
