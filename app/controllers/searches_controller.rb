class SearchesController < ApplicationController

	def search_results
		# Vehicle.where(available: 1, city: params[:city], area: params[:area], pickup_date: params[:pickup_date], dropoff_date: params[:dropoff_date], pickup_time)
		@vehicle = Vehicle.all.each_slice(3).to_a
	end
end
