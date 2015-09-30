class BoatsController < ApplicationController
  before_action :find_harbour, only: [:index, :create, :new, :show, :edit, :update, :destroy]

  # GET /boats
  # GET /boats.json
  def index
    @boats = Boat.all
  end

  # GET /boats/1
  # GET /boats/1.json
  def show
    set_boat
  end

  def selection
    @boats = Boat.where(capacity: params[:boats_capacity_search] )
    @harbour = Harbour.where(city: params[:harbour_search])
  end
  # GET /boats/new
  def new
    @boat = Boat.new
  end

  # GET /boats/1/edit
  def edit
    set_boat
  end

  # POST /boats
  # POST /boats.json
  def create
    @boat = @harbour.boats.build(boat_params)
    @boat.save
    redirect_to harbour_boats_path(@harbour, @boat)
    # respond_to do |format|
    #   if @boat.save
    #     format.html { redirect_to harbour_boats_path, notice: 'Boat was successfully created.' }
    #     format.json { render :show, status: :created, location: @boat }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @boat.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /boats/1
  # PATCH/PUT /boats/1.json
  def update
    respond_to do |format|
      if @boat.update(boat_params)
        format.html { redirect_to harbour_boats_path, notice: 'Boat was successfully updated.' }
        format.json { render :show, status: :ok, location: @boat }
      else
        format.html { render :edit }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    set_boat
    @boat.destroy
    respond_to do |format|
      format.html { redirect_to harbour_boats_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boat
      @boat = Boat.find(params[:id])
    end

    def find_harbour
      @harbour = Harbour.find(params[:harbour_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boat_params
      params.require(:boat).permit(:name, :capacity, :size, :price_per_day, :description)
    end
end
