class TadpolesController < ApplicationController
  def index
    @tadpoles = Tadpole.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tadpoles }
    end
  end

  def create
    if Tadpole.create(tadpole_params)
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def new
    @frog = Frog.find(params[:id])
    @tadpole = Tadpole.new
  end

  def edit
    @tadpole = Tadpole.find(params[:id])
  end

  def show
    @tadpole = Tadpole.find(params[:id])
  end

  def update
    @tadpole = Tadpole.find(params[:id])
      if @tadpole.update_attributes(tadpole_params)
         redirect_to :action => 'index'
      else
         render :action => 'edit', :id => @tadpole
      end
  end

  def destroy
    Tadpole.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def evolve
    tadpole = Tadpole.find(params[:id])
    Frog.create(name: tadpole.name, color: tadpole.color, pond_id: tadpole.frog.pond_id)
    tadpole.destroy
    redirect_to :action => 'index', :controller => 'frogs'
  end

  private

  def tadpole_params
    params.require(:tadpole).permit(:name, :color, :frog_id)
  end
end
