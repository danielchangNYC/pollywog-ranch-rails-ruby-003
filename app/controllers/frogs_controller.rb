class FrogsController < ApplicationController
  def index
    @frogs = Frog.all
  end

  def create
    if Frog.create(frog_params)
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def new
    @frog = Frog.new(:pond_id => 1)
  end

  def edit
    @frog = Frog.find(params[:id])
    @ponds = Pond.all
  end

  def show
    @frog = Frog.find(params[:id])
  end

  def update
    @frog = Frog.find(params[:id])
      if @frog.update_attributes(frog_params)
         redirect_to :action => 'index'
      else
         render :action => 'edit', :id => @frog
      end
  end

  def destroy
    Frog.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  private

  def frog_params
    params.require(:frog).permit(:name, :color, :pond_id)
  end
end
