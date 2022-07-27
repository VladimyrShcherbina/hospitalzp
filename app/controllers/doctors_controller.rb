class DoctorsController < ApplicationController
	before_action :authenticate_doctor!
	before_action :authenticate_user!, only:[:index]
	before_action :set_doctor, only:[:show]

	def index
		@doctor = current_doctor 
	end

	def show
		@doctors = Doctor.all
	end

	private

	def set_doctor
		@doctor = Doctor.find(params[:id])
	end
end
