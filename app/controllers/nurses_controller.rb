class NursesController < ApplicationController
  def index
    matching_nurses = Nurse.all

    @list_of_nurses = matching_nurses.order({ :created_at => :desc })

    render({ :template => "nurses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_nurses = Nurse.where({ :id => the_id })

    @the_nurse = matching_nurses.at(0)

    render({ :template => "nurses/show.html.erb" })
  end

  def create
    the_nurse = Nurse.new
    the_nurse.first_name = params.fetch("query_first_name")
    the_nurse.last_name = params.fetch("query_last_name")
    the_nurse.phone_number = params.fetch("query_phone_number")
    the_nurse.position = params.fetch("query_position")
    the_nurse.specialty = params.fetch("query_specialty")

    if the_nurse.valid?
      the_nurse.save
      redirect_to("/nurses", { :notice => "Nurse created successfully." })
    else
      redirect_to("/nurses", { :alert => the_nurse.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_nurse = Nurse.where({ :id => the_id }).at(0)

    the_nurse.first_name = params.fetch("query_first_name")
    the_nurse.last_name = params.fetch("query_last_name")
    the_nurse.phone_number = params.fetch("query_phone_number")
    the_nurse.position = params.fetch("query_position")
    the_nurse.specialty = params.fetch("query_specialty")

    if the_nurse.valid?
      the_nurse.save
      redirect_to("/nurses/#{the_nurse.id}", { :notice => "Nurse updated successfully."} )
    else
      redirect_to("/nurses/#{the_nurse.id}", { :alert => the_nurse.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_nurse = Nurse.where({ :id => the_id }).at(0)

    the_nurse.destroy

    redirect_to("/nurses", { :notice => "Nurse deleted successfully."} )
  end
end
