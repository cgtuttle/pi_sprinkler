class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.order(:id)
    @program = Program.new
    logger.debug "$system_status= #{$system_status}"
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    @stations = @program.stations.order(:sequence)
  end

  # GET /programs/new
  def new
    @program = Program.new
  end

  # GET /programs/1/edit
  def edit
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(program_params)

    respond_to do |format|
      if @program.save
        @program.add_stations
        format.html { redirect_to programs_path, notice: 'Program was successfully created.' }
        format.json { render :show, status: :created, location: @program }
      else
        format.html { render :new }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to programs_path, notice: 'Program was successfully updated.' }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url, notice: 'Program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /programs/1/enable/1
  def enable
    @program = Program.find(params[:id])
    @enable = params[:enable] == "true"
    @program.enabled = @enable
    @program.save
    verb = @enable ? "enabled" : "disabled"
    redirect_to :back
  end

  # GET /programs/run
  def run
    @program = Program.where(enabled: true).first
    if $system_status != "off" # Switch to off...
      logger.debug "Processing 'Stop' command, program = #{@program}"
      $system_status = "off"
    else # Switch to waiting...
      logger.debug "Processing 'Run' command"
      $system_status = "auto"
      logger.debug "Calling jobs"
      StatusJob.perform_async(@program)
      StationJob.perform_async(@program)
    end
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.require(:program).permit(:name, :start_time, :last_run_on, rule_ids: [], program_stations_attributes: [:id, :duration, :station_id, :sequence])
    end
end
