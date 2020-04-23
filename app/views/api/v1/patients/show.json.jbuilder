json.extract! @patient, :id, :nom, :prenom, :age, :tel
json.rdvs @patient.rdvs do |rdv|
  json.extract! rdv, :date_rdv, :salle, :examen
end
