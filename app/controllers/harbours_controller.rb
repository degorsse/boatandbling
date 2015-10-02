class HarboursController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
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

    set_harbour
    @boats_in_harbour = Boat.joins(:harbour).where('harbour.id =?', @harbour.id)
    @boats = Boat.all
    @selection = []
      @boats.each do |b|
        if b.harbour == @harbour
          @selection << b
        end
      end


  end

# @croc = Boat.all.where(b.harbour == @harbour))

  def edit
    set_harbour
  end

  def update
    set_harbour
    @harbour.update(params_harbour)
    redirect_to harbours_path
  end

  def destroy
   set_harbour
   @harbour.destroy
   redirect_to harbours_path

  end

  def post_params
  params.require(:harbour).permit(:title, :body, :picture)
  end


  private


  def set_harbour
    @harbour = Harbour.find(params[:id])
  end

  def params_harbour
    params.require(:harbour).permit(:name, :address, :city, :picture)
  end


end
