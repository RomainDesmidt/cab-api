json.array! @rdvs do |rdv|
  json.extract! rdv, :id, :date_rdv, :salle, :examen
end
