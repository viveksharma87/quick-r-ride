class VehiclesController < ApplicationController
  before_action :find_person

	def new
	end

	def create
		if params[:vehicle_type] == "2"
			@vehicle = Bike.create(params_vihicle.merge(seater: 2, person_id: @person.id))
		elsif params[:vehicle_type] == "4"
			@vehicle = Car.create(params_vihicle)
		end
		if @vehicle.errors.any?
			render :new
		else
      redirect_to person_path(@person.id)
    end
	end

	private
	def params_vihicle
		params[:person_id] = @person.id
		if params[:vehicle_type] == 2
		  params.permit(:number, :modal, :image)
		else
			params.permit(:number, :modal, :seater, :image, :person_id)
		end
	end

	def find_person
		@person = Person.find(params[:person_id])
	end
end
