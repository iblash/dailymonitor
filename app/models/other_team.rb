# == Schema Information
#
# Table name: other_teams
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  position     :string
#  specialty    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class OtherTeam < ApplicationRecord
end
