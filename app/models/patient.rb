class Patient < ApplicationRecord
  belongs_to :user
  has_many :rdvs
  accepts_nested_attributes_for :rdvs, :allow_destroy => true
end
