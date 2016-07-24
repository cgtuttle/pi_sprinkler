class ProgramRulesController < ApplicationController
  before_action :set_program_rule, only: [:show, :edit, :update, :destroy]

  # GET /program_rules
  # GET /program_rules.json
  def index
    @program_rules = ProgramRule.all
  end

  # GET /program_rules/1
  # GET /program_rules/1.json
  def show
  end

  # GET /program_rules/new
  def new
    @program_rule = ProgramRule.new
  end

  # GET /program_rules/1/edit
  def edit
  end

  # POST /program_rules
  # POST /program_rules.json
  def create
    @program_rule = ProgramRule.new(program_rule_params)

    respond_to do |format|
      if @program_rule.save
        format.html { redirect_to @program_rule, notice: 'Program rule was successfully created.' }
        format.json { render :show, status: :created, location: @program_rule }
      else
        format.html { render :new }
        format.json { render json: @program_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_rules/1
  # PATCH/PUT /program_rules/1.json
  def update
    respond_to do |format|
      if @program_rule.update(program_rule_params)
        format.html { redirect_to @program_rule, notice: 'Program rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @program_rule }
      else
        format.html { render :edit }
        format.json { render json: @program_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_rules/1
  # DELETE /program_rules/1.json
  def destroy
    @program_rule.destroy
    respond_to do |format|
      format.html { redirect_to program_rules_url, notice: 'Program rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_rule
      @program_rule = ProgramRule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_rule_params
      params.require(:program_rule).permit(:program_id, :rule)
    end
end
