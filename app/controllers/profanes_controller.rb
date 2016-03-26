class ProfanesController < ApplicationController
  before_action :set_profane, only: [:show, :edit, :update, :destroy]

  def isprofane
  @input2 = params[:search_string2]
  @result2 = Profanechecker.remove_insults(params[:search_string2])
  end
  # GET /profanes
  # GET /profanes.json
  def index
    @profanes = Profane.all
  end

  # GET /profanes/1
  # GET /profanes/1.json
  def show
  end

  # GET /profanes/new
  def new
    @profane = Profane.new
  end

  # GET /profanes/1/edit
  def edit
  end

  # POST /profanes
  # POST /profanes.json
  def create
    @profane = Profane.new(profane_params)

    respond_to do |format|
      if @profane.save
        format.html { redirect_to @profane, notice: 'Profane was successfully created.' }
        format.json { render :show, status: :created, location: @profane }
      else
        format.html { render :new }
        format.json { render json: @profane.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profanes/1
  # PATCH/PUT /profanes/1.json
  def update
    respond_to do |format|
      if @profane.update(profane_params)
        format.html { redirect_to @profane, notice: 'Profane was successfully updated.' }
        format.json { render :show, status: :ok, location: @profane }
      else
        format.html { render :edit }
        format.json { render json: @profane.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profanes/1
  # DELETE /profanes/1.json
  def destroy
    @profane.destroy
    respond_to do |format|
      format.html { redirect_to profanes_url, notice: 'Profane was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profane
      @profane = Profane.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profane_params
      params.require(:profane).permit(:text)
    end
end
