# == Schema Information
#
# Table name: hospitals
#
#  id            :integer          not null, primary key
#  address       :string
#  hospital_name :string
#  phone_number  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  doctor_id     :integer
#  nurse_id      :integer
#  other_team_id :integer
#  patient_id    :integer
#
class Hospital < ApplicationRecord
end
