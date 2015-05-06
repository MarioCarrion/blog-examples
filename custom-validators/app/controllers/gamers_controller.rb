class GamersController < ApplicationController
  def index
    @gamer = Gamer.first
  end

  def update
    @gamer = Gamer.find(params[:id])
 
    if @gamer.update(gamer_params)
      redirect_to gamers_path
    else
      render 'index'
    end
  end

  private
  def gamer_params
    params.require(:gamer).permit!#(:name, :games_attributes)!
  end
end
