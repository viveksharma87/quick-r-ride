class PersonsController < ApplicationController
	# befor_action :find_person, only: [:show]
	def new
		@person = Person.new
	end

	def get_person
	end

	def login
		person = Person.where("user_name = ? or email = ? or mobile_number = ?", params[:user_name], params[:user_name], params[:user_name]).first
		if person.present? && !person.errors.any?
			if person.present?
				if person.password == params[:password]
		      redirect_to person_path(person.id)
		    else
		    	flash[:error] = "User Name/Password is incurrect"
		    	redirect_to get_person_persons_path
		    end
		  else
			  flash[:error] = "Record not found, Register your self"
			  redirect_to get_person_persons_path
		  end
		else
			flash[:error] = "Record not found, Register your self"
			redirect_to get_person_persons_path
		end
	end

	def search
		# person = Person.where("user_name = ? or email = ? or mobile_number = ?", params[:user_name], params[:user_name], params[:user_name]).first
		# if !person.errors.any?
		# 	if person.present?
		# 		if person.password == params[:password]
		#       redirect_to person_vehicles_path(person.id)
		#     else
		#     	flash[:error] = "User Name/Password is incurrect"
		#     	render :get_person
		#     end
		#   else
		# 	  flash[:error] = "Record not fount, Register your self"
		# 	  render :get_person
		#   end
		# else
		# 	render :get_person
		# end
	end

	def create
		@person = Person.create(person_params)
		if @person.errors.any?
			flash[:error] = @person.errors.full_messages.collect{|mes| mes}
			redirect_to new_person_path
		else
      redirect_to new_person_vehicle_path(@person.id)
    end
	end

	def show
		@person = Person.find(params[:id])
		if @person.present?
		  @vehicles = @person.vehicles
		end
	end

	private
  def person_params
    params.permit(:first_name, :last_name, :mobile_number, :email, :address, :user_name, :password, :image, :password_confirmation, :gender)
  end

  def find_person
  	@person = Person.where("user_name = ? or email = ? or mobile_number = ?", params[:user_name], params[:user_name], params[:user_name]).first
  end
end
