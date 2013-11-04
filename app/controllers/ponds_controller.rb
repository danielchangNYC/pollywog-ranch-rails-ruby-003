class PondsController < ApplicationController
  def index
    @ponds = Pond.all
  end

  def create
    if Pond.create(pond_params)
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def new
    @pond = Pond.new
  end

  def edit
    @pond = Pond.find(params[:id])
  end

  def show
    @pond = Pond.find(params[:id])
  end

  def update
    @pond = Pond.find(params[:id])
      if @pond.update_attributes(pond_params)
         redirect_to :action => 'index'
      else
         render :action => 'edit', :id => @pond
      end
  end

  def destroy
    Pond.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  private

  def pond_params
    params.require(:pond).permit(:name, :water_type)
  end

end