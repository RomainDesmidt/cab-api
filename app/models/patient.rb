class Patient < ApplicationRecord
  belongs_to :user
  has_many :rdvs
end
