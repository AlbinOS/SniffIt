class TastingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @wine = Wine.find(params[:wine_id])
    @tasting = @wine.tastings.build(tasting_params)
    if @tasting.save
      redirect_to wine_path(@wine)
    else
      render "wines/show"
    end
  end

  def destroy
    @wine = Wine.find(params[:wine_id])
    @tasting = @wine.tastings.find(params[:id])
    @tasting.destroy
    redirect_to wine_path(@wine)
  end

  private

  def tasting_params
    params.require(:tasting).permit(:taster, :body)
  end
end
