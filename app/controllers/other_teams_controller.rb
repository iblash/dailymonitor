class OtherTeamsController < ApplicationController
  def index
    matching_other_teams = OtherTeam.all

    @list_of_other_teams = matching_other_teams.order({ :created_at => :desc })

    render({ :template => "other_teams/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_other_teams = OtherTeam.where({ :id => the_id })

    @the_other_team = matching_other_teams.at(0)

    render({ :template => "other_teams/show.html.erb" })
  end

  def create
    the_other_team = OtherTeam.new
    the_other_team.first_name = params.fetch("query_first_name")
    the_other_team.last_name = params.fetch("query_last_name")
    the_other_team.phone_number = params.fetch("query_phone_number")
    the_other_team.position = params.fetch("query_position")
    the_other_team.specialty = params.fetch("query_specialty")

    if the_other_team.valid?
      the_other_team.save
      redirect_to("/other_teams", { :notice => "Other team created successfully." })
    else
      redirect_to("/other_teams", { :alert => the_other_team.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_other_team = OtherTeam.where({ :id => the_id }).at(0)

    the_other_team.first_name = params.fetch("query_first_name")
    the_other_team.last_name = params.fetch("query_last_name")
    the_other_team.phone_number = params.fetch("query_phone_number")
    the_other_team.position = params.fetch("query_position")
    the_other_team.specialty = params.fetch("query_specialty")

    if the_other_team.valid?
      the_other_team.save
      redirect_to("/other_teams/#{the_other_team.id}", { :notice => "Other team updated successfully."} )
    else
      redirect_to("/other_teams/#{the_other_team.id}", { :alert => the_other_team.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_other_team = OtherTeam.where({ :id => the_id }).at(0)

    the_other_team.destroy

    redirect_to("/other_teams", { :notice => "Other team deleted successfully."} )
  end
end
