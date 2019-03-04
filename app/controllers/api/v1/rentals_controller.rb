class Api::V1::RentalsController < ApplicationController
	def index
		@rentals = Rental.all
		render :json => @rentals, each_serializer: RentalsSerializer
	end

	def show
		@rental = Tmdb::Movie.detail(params[:id])
		render :json => @rental, each_serializer: RentalsSerializer
	end

	def create
    @rental = Rental.create(rental_params)
    render :json => @rental, each_serializer: RentalsSerializer
  end

	def destroy
		@rental = Rental.find(params[:id])
		@rental.destroy
	end



	private
	def rental_params
		params.require(:rentals).permit(:movie_id, :user_id)
	end

end
