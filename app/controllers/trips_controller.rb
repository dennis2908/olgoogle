class TripsController < ApplicationController
      def index
      end

      # function for creating a new trip
      def create
        @trip = Trip.new(trip_params)
        @trip.checkins.build(lat: params[:lat], lng: params[:lng])
        render json: @trip.as_json if @trip.save
      end

      # function for showing a trip
      def show
        @trip = Trip.find_by(uuid: params[:id])
      end

      private
        def trip_params
          params.permit(:name)
        end
    end

    # app/controllers/checkins_controller.rb

    class CheckinsController < ApplicationController
      def create
        @checkin = Checkin.new(checkin_params)
        render json: @checkin.as_json(only: [:lat, :lng, :trip_id]) if @checkin.save
      end

      private
        def checkin_params
          params.permit(:trip_id, :lat, :lng)
        end
    end