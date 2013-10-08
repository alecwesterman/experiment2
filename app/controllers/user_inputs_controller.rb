class UserInputsController < ApplicationController
  before_action :set_user_input, only: [:show, :edit, :update, :destroy]

  # GET /user_inputs
  # GET /user_inputs.json
  def index
    @user_inputs = UserInput.all
  end

  # GET /user_inputs/1
  # GET /user_inputs/1.json
  def show
    @facts = @user_input.facts
  end

  # GET /user_inputs/new
  def new
    @user_input = UserInput.new
  end

  # GET /user_inputs/1/edit
  def edit
  end

  # POST /user_inputs
  # POST /user_inputs.json
  def create
    @user_input = UserInput.new(user_input_params)
    Fact.create_facts(@user_input)

    respond_to do |format|
      if @user_input.save
        format.html { redirect_to @user_input, notice: 'User input was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_input }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_inputs/1
  # PATCH/PUT /user_inputs/1.json
  def update
    respond_to do |format|
      if @user_input.update(user_input_params)
        format.html { redirect_to @user_input, notice: 'User input was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_input.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_inputs/1
  # DELETE /user_inputs/1.json
  def destroy
    @user_input.destroy
    respond_to do |format|
      format.html { redirect_to user_inputs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_input
      @user_input = UserInput.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_input_params
      params.require(:user_input).permit(:body)
    end
end
