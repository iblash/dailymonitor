# == Schema Information
#
# Table name: patients
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  phone_number    :string
#  transplant_date :string
#  transplant_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  doctor_id       :integer
#  hospital_id     :integer
#  medicine_id     :integer
#  nurse_id        :integer
#  other_team_id   :integer
#
class Patient < ApplicationRecord
end
