class Api::V1::PatientsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_patient, only: [ :update, :destroy ]
  def index
    @patients = policy_scope(Patient)
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user
    authorize @patient
    if @patient.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @patient.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end


  def show
    @patient = Patient.find(params[:id])
    authorize @patient
  end

  def update
    if @patient.update(patient_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_patient
     # For Pundit
    @patient = Patient.find(params[:id])
    authorize @patient
  end

  def patient_params
    params.require(:patient).permit(:nom, :prenom, :tel, :age, :rdvs_attributes => [ :id, :date_rdv, :salle, :examen ])
  end

  def render_error
    render json: { errors: @patient.errors.full_messages },
      status: :unprocessable_entity
  end
end
