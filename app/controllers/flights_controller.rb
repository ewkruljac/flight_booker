class FlightsController < ApplicationController

  def new
    @flight = Flight.new
  end

  def index
    @all_airports = Airport.all.map{ |u| [u.city, u.id] }
    @dates = Flight.all.map{ |u| [u.date.strftime("%A, %m/%d/%Y"), u.date.to_date] }.uniq
    @flights = Flight.all
    @passengers = (1..4).map { |u| [u, u]}

    @matching_flights = Flight.find_matching_flights(params)
  end

end
