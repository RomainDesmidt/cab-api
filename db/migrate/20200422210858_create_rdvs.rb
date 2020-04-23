class CreateRdvs < ActiveRecord::Migration[6.0]
  def change
    create_table :rdvs do |t|
      t.date :date_rdv
      t.integer :salle
      t.string :examen
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
