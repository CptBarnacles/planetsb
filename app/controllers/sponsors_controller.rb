class SponsorsController < ApplicationController
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?
  # GET /sponsors
  # GET /sponsors.json
  def index
    @sponsors = Sponsor.order(:created_at).page(params[:page])
    @line_items = LineItem.all
    if current_user && !current_user.admin
      @users = User.find(params[:user_id])
    else 
      @users = User.all
    end
  end

  # GET /sponsors/1
  # GET /sponsors/1.json
  def show
  end

  # GET /sponsors/new
  def new
    @sponsor = Sponsor.new
    @planet = Planet.find(params[:planet_id])
    @users = User.all
  end

  # GET /sponsors/1/edit
  def edit
    @planets = Planet.all
  end

  # POST /sponsors
  # POST /sponsors.json
  def create
    @sponsor = Sponsor.new(sponsor_params)
    respond_to do |format|
      if @sponsor.save
        format.html { redirect_to planets_path, info: 'Sponsor was successfully created.' }
        format.json { render :show, status: :created, location: @sponsor }
      else
        format.html { render :new }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    logger.debug "Planet ID invalid: #{@planet_id.inspect}"
    end
  end

  # PATCH/PUT /sponsors/1
  # PATCH/PUT /sponsors/1.json
  def update
    respond_to do |format|
      if @sponsor.update(sponsor_params)
        format.html { redirect_to @sponsor, notice: 'Sponsor was successfully updated.' }
        format.json { render :show, status: :ok, location: @sponsor }
      else
        format.html { render :edit }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.json
  def destroy
    @sponsor.destroy
    respond_to do |format|
      format.html { redirect_to sponsors_url, notice: 'Sponsor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sponsor_params
      params.require(:sponsor).permit(:first_name, :last_name, :user_id, :planet_id)
    end
end
