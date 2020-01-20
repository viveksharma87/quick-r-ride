class VehiclesController < ApplicationController
  before_action :find_person

	def new
	end

	def create
		if params[:vehicle_type] == "2"
			@vehicle = Bike.create(params_vihicle.merge(seater: 2, person_id: @person.id))
		elsif params[:vehicle_type] == "4"
			@vehicle = Car.create(params_vihicle.merge(person_id: @person.id))
		end
		if @vehicle.errors.any?
			render :new
		else
      redirect_to new_person_vehicle_path(@person.id)
    end
	end

	private
	def params_vihicle
		if params[:vehicle_type] == 2
		  params.permit(:number, :modal)
		else
			params.permit(:number, :modal, :seater)
		end
	end

	def find_person
		@person = Person.find(params[:person_id])
	end
end
