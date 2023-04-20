class MedicinesController < ApplicationController
  def index
    matching_medicines = Medicine.all

    @list_of_medicines = matching_medicines.order({ :created_at => :desc })

    render({ :template => "medicines/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_medicines = Medicine.where({ :id => the_id })

    @the_medicine = matching_medicines.at(0)

    render({ :template => "medicines/show.html.erb" })
  end

  def create
    the_medicine = Medicine.new
    the_medicine.med_name = params.fetch("query_med_name")
    the_medicine.strength = params.fetch("query_strength")
    the_medicine.dosage = params.fetch("query_dosage")
    the_medicine.patient_id = params.fetch("query_patient_id")
    the_medicine.doctor_id = params.fetch("query_doctor_id")

    if the_medicine.valid?
      the_medicine.save
      redirect_to("/medicines", { :notice => "Medicine created successfully." })
    else
      redirect_to("/medicines", { :alert => the_medicine.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_medicine = Medicine.where({ :id => the_id }).at(0)

    the_medicine.med_name = params.fetch("query_med_name")
    the_medicine.strength = params.fetch("query_strength")
    the_medicine.dosage = params.fetch("query_dosage")
    the_medicine.patient_id = params.fetch("query_patient_id")
    the_medicine.doctor_id = params.fetch("query_doctor_id")

    if the_medicine.valid?
      the_medicine.save
      redirect_to("/medicines/#{the_medicine.id}", { :notice => "Medicine updated successfully."} )
    else
      redirect_to("/medicines/#{the_medicine.id}", { :alert => the_medicine.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_medicine = Medicine.where({ :id => the_id }).at(0)

    the_medicine.destroy

    redirect_to("/medicines", { :notice => "Medicine deleted successfully."} )
  end
end
