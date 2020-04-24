class Api::V1::RdvsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show, :index_all ]
  before_action :set_rdv, only: [ :update, :destroy ]

  def index
    @patient = Patient.find(params[:patient_id])
    @rdv = policy_scope(Rdv)
    @rdvs = @patient.rdvs
    authorize @rdvs
    authorize @patient
  end

  def index_all
    @rdvs = policy_scope(Rdv)
  end

  def create
    @rdv = Rdv.new(rdv_params)
    @rdv.patient = Patient.find(params[:patient_id])
    authorize @rdv
    if @rdv.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @rdv.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end


  def show
    @rdv = Rdv.find(params[:id])
    authorize @rdv
  end

  def update
    if @rdv.update(rdv_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_rdv
     # For Pundit
    @rdv = Rdv.find(params[:id])
    authorize @rdv
  end

  def rdv_params
    params.require(:rdv).permit(:date_rdv, :salle, :examen )
  end

  def render_error
    render json: { errors: @rdv.errors.full_messages },
      status: :unprocessable_entity
  end
end
