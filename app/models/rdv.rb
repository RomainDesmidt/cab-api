class Rdv < ApplicationRecord
  belongs_to :patient, optional: true
end
