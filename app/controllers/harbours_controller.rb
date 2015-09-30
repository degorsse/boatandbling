class HarboursController < ApplicationController
  def index
    @harbours = Harbour.all

  end

  def new
    @harbour = Harbour.new
  end

  def create
    @harbour = Harbour.new(params_harbour)

    respond_to do |format|
      if @harbour.save
        format.html { redirect_to harbours_path, notice: 'Harbour was successfully created.' }
        format.json { render :show, status: :created, location: @harbour }
      else
        format.html { render :new }
        format.json { render json: @harbour.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
   set_harbour
   @harbour.delete
   redirect_to harbours_path

  end


  private


  def set_harbour
    @harbour = Harbour.find(params[:id])
  end

  def params_harbour
    params.require(:harbour).permit(:name,:address,:city)
  end


end
