class HospitalsController < ApplicationController
  def index
    matching_hospitals = Hospital.all

    @list_of_hospitals = matching_hospitals.order({ :created_at => :desc })

    render({ :template => "hospitals/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_hospitals = Hospital.where({ :id => the_id })

    @the_hospital = matching_hospitals.at(0)

    render({ :template => "hospitals/show.html.erb" })
  end

  def create
    the_hospital = Hospital.new
    the_hospital.hospital_name = params.fetch("query_hospital_name")
    the_hospital.address = params.fetch("query_address")
    the_hospital.phone_number = params.fetch("query_phone_number")
    the_hospital.patient_id = params.fetch("query_patient_id")
    the_hospital.doctor_id = params.fetch("query_doctor_id")
    the_hospital.nurse_id = params.fetch("query_nurse_id")
    the_hospital.other_team_id = params.fetch("query_other_team_id")

    if the_hospital.valid?
      the_hospital.save
      redirect_to("/hospitals", { :notice => "Hospital created successfully." })
    else
      redirect_to("/hospitals", { :alert => the_hospital.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_hospital = Hospital.where({ :id => the_id }).at(0)

    the_hospital.hospital_name = params.fetch("query_hospital_name")
    the_hospital.address = params.fetch("query_address")
    the_hospital.phone_number = params.fetch("query_phone_number")
    the_hospital.patient_id = params.fetch("query_patient_id")
    the_hospital.doctor_id = params.fetch("query_doctor_id")
    the_hospital.nurse_id = params.fetch("query_nurse_id")
    the_hospital.other_team_id = params.fetch("query_other_team_id")

    if the_hospital.valid?
      the_hospital.save
      redirect_to("/hospitals/#{the_hospital.id}", { :notice => "Hospital updated successfully."} )
    else
      redirect_to("/hospitals/#{the_hospital.id}", { :alert => the_hospital.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_hospital = Hospital.where({ :id => the_id }).at(0)

    the_hospital.destroy

    redirect_to("/hospitals", { :notice => "Hospital deleted successfully."} )
  end
end
