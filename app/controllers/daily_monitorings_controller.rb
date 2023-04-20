class DailyMonitoringsController < ApplicationController
  def index
    matching_daily_monitorings = DailyMonitoring.all

    @list_of_daily_monitorings = matching_daily_monitorings.order({ :created_at => :desc })

    render({ :template => "daily_monitorings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_daily_monitorings = DailyMonitoring.where({ :id => the_id })

    @the_daily_monitoring = matching_daily_monitorings.at(0)

    render({ :template => "daily_monitorings/show.html.erb" })
  end

  def create
    the_daily_monitoring = DailyMonitoring.new
    the_daily_monitoring.title = params.fetch("query_title")
    
    the_daily_monitoring.description = params.fetch("query_description")
    the_daily_monitoring.patient_id = params.fetch("query_patient_id")

    if the_daily_monitoring.valid?
      the_daily_monitoring.save
      redirect_to("/daily_monitorings", { :notice => "Daily monitoring created successfully." })
    else
      redirect_to("/daily_monitorings", { :alert => the_daily_monitoring.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_daily_monitoring = DailyMonitoring.where({ :id => the_id }).at(0)

    the_daily_monitoring.title = params.fetch("query_title")
    
    the_daily_monitoring.description = params.fetch("query_description")
    the_daily_monitoring.patient_id = params.fetch("query_patient_id")

    if the_daily_monitoring.valid?
      the_daily_monitoring.save
      redirect_to("/daily_monitorings/#{the_daily_monitoring.id}", { :notice => "Daily monitoring updated successfully."} )
    else
      redirect_to("/daily_monitorings/#{the_daily_monitoring.id}", { :alert => the_daily_monitoring.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_daily_monitoring = DailyMonitoring.where({ :id => the_id }).at(0)

    the_daily_monitoring.destroy

    redirect_to("/daily_monitorings", { :notice => "Daily monitoring deleted successfully."} )
  end
end
