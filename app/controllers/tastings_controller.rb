class TastingsController < ApplicationController
  def create
    @wine = Wine.find(params[:wine_id])
    @tasting = @Wine.tastings.create(tasting_params)
    redirect_to wine_path(@wine)
  end

  private

  def tasting_params
    params.require(:tasting).permit(:taster, :body)
  end
end
