# == Schema Information
#
# Table name: medicines
#
#  id         :integer          not null, primary key
#  dosage     :string
#  med_name   :string
#  strength   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  doctor_id  :integer
#  patient_id :integer
#
class Medicine < ApplicationRecord
end
