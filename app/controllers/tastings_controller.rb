class TastingsController < ApplicationController
  before_action :authenticate_user!

  def show
    @tasting = Tasting.find(params[:id])
  end
  
  def new
    @wine = Wine.find(params[:wine_id])
    @tasting = Tasting.new
  end

  def edit
    @tasting = Tasting.find(params[:id])
    @wine = @tasting.wine
  end


  def create
    @wine = Wine.find(params[:wine_id])

    params[:tasting] = {user_id: current_user.id}
    @tasting = @wine.tastings.build(tasting_params)
    @tasting.build_visual_analysis(visual_analysis_params)
    @tasting.build_olfactory_analysis(olfactory_analysis_params)
    @tasting.build_gustatory_analysis(gustatory_analysis_params)
    @tasting.build_analysis_conclusion(analysis_conclusion_params)

    if @tasting.save
      redirect_to wine_path(@wine)
    else
      flash.now[:alert] = "Your data were not accepted, check your form below !"
      render "wines/show"
    end
  end

  def update
    @tasting = Tasting.find(params[:id])

    params[:tasting] = {user_id: current_user.id}
    @tasting.visual_analysis.update(visual_analysis_params)
    @tasting.olfactory_analysis.update(olfactory_analysis_params)
    @tasting.gustatory_analysis.update(gustatory_analysis_params)
    @tasting.analysis_conclusion.update(analysis_conclusion_params)

    if @tasting.update(tasting_params)
      redirect_to wine_path(@tasting.wine)
    else
      flash.now[:alert] = "Your data were not accepted, check your form below !"
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
    params.require(:tasting).permit(:user_id)
  end

  def visual_analysis_params
    params.require(:visual_analysis).permit(:color, :intensity, :nuance, :limpidity, :brightness, :density, :effervescence)
  end

  def olfactory_analysis_params
    params.require(:olfactory_analysis).permit(:intensity, :diversity, :quality)
  end

  def gustatory_analysis_params
    params.require(:gustatory_analysis).permit(:acidity, :alcohol, :mellowness, :tannin_quantity, :tannin_quality)
  end

  def analysis_conclusion_params
    params.require(:analysis_conclusion).permit(:balance, :pai, :overall_sentiment, :future)
  end

end
