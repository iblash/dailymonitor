# == Schema Information
#
# Table name: nurses
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
class Nurse < ApplicationRecord
end
