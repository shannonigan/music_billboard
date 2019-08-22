class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :edit, :update, :destroy]

  def index
    @billboard = Billboard.all
  end


  def show
  end


  def update
    if @billboard.update(billboard_params)
      redirect_to billboard_path(@billboard)
    else
      reder :edit
    end
  end


  def new
    @billboard = Billboard.new
    render partial: 'form'
  end


  def edit
    render partial: 'form'
  end

  def create
    @billboard = Billboard.new(billboard_params)

      if @billboard.save
        redirect_to billboards_path
      else
        render :new
      end
  end

  def destroy
    @billboard.destroy
    redirect_to billboards_path
  end

  private
    def billboard_params
      params.require(:billboard).permit(:name)
    end

    def set_billboard
      @billboard = Billboard.find(params[:id])
    end
end
