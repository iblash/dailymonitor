class PatientsController < ApplicationController
  def index
    matching_patients = Patient.all

    @list_of_patients = matching_patients.order({ :created_at => :desc })

    render({ :template => "patients/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_patients = Patient.where({ :id => the_id })

    @the_patient = matching_patients.at(0)

    render({ :template => "patients/show.html.erb" })
  end

  def create
    the_patient = Patient.new
    the_patient.first_name = params.fetch("query_first_name")
    the_patient.last_name = params.fetch("query_last_name")
    the_patient.phone_number = params.fetch("query_phone_number")
    the_patient.transplant_type = params.fetch("query_transplant_type")
    the_patient.transplant_date = params.fetch("query_transplant_date")
    the_patient.doctor_id = params.fetch("query_doctor_id")
    the_patient.nurse_id = params.fetch("query_nurse_id")
    the_patient.other_team_id = params.fetch("query_other_team_id")
    the_patient.medicine_id = params.fetch("query_medicine_id")
    the_patient.hospital_id = params.fetch("query_hospital_id")

    if the_patient.valid?
      the_patient.save
      redirect_to("/patients", { :notice => "Patient created successfully." })
    else
      redirect_to("/patients", { :alert => the_patient.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_patient = Patient.where({ :id => the_id }).at(0)

    the_patient.first_name = params.fetch("query_first_name")
    the_patient.last_name = params.fetch("query_last_name")
    the_patient.phone_number = params.fetch("query_phone_number")
    the_patient.transplant_type = params.fetch("query_transplant_type")
    the_patient.transplant_date = params.fetch("query_transplant_date")
    the_patient.doctor_id = params.fetch("query_doctor_id")
    the_patient.nurse_id = params.fetch("query_nurse_id")
    the_patient.other_team_id = params.fetch("query_other_team_id")
    the_patient.medicine_id = params.fetch("query_medicine_id")
    the_patient.hospital_id = params.fetch("query_hospital_id")

    if the_patient.valid?
      the_patient.save
      redirect_to("/patients/#{the_patient.id}", { :notice => "Patient updated successfully."} )
    else
      redirect_to("/patients/#{the_patient.id}", { :alert => the_patient.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_patient = Patient.where({ :id => the_id }).at(0)

    the_patient.destroy

    redirect_to("/patients", { :notice => "Patient deleted successfully."} )
  end
end
