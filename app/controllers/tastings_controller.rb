class TastingsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_and_authorize_resource
  after_action :verify_authorized

  def show
  end

  def new
    @wine = Wine.find(params[:wine_id])
    @tasting.build_visual_analysis()
    @tasting.build_olfactory_analysis()
    @tasting.build_gustatory_analysis()
    @tasting.build_analysis_conclusion()
  end

  def edit
    @wine = @tasting.wine
  end

  def create
    @wine = Wine.find(params[:wine_id])

    @tasting = @wine.tastings.build(tasting_params)
    @tasting.user = current_user
    @tasting.build_visual_analysis(visual_analysis_params)
    @tasting.build_olfactory_analysis(olfactory_analysis_params)
    if params[:olfactory_analysis] && params[:olfactory_analysis][:olfactory_natures]
      build_olfactory_natures(@tasting.olfactory_analysis, params[:olfactory_analysis][:olfactory_natures])
    end
    @tasting.build_gustatory_analysis(gustatory_analysis_params)
    @tasting.build_analysis_conclusion(analysis_conclusion_params)

    if @tasting.save
      redirect_to [@wine, @tasting]
    else
      flash.now[:alert] = "Your data were not accepted, check your form below !"
      render "wines/show"
    end
  end

  def update
    @tasting.visual_analysis.assign_attributes(visual_analysis_params)
    @tasting.olfactory_analysis.assign_attributes(olfactory_analysis_params)
    @tasting.gustatory_analysis.assign_attributes(gustatory_analysis_params)
    @tasting.analysis_conclusion.assign_attributes(analysis_conclusion_params)

    if @tasting.save
      redirect_to wine_path(@tasting.wine)
    else
      flash.now[:alert] = "Your data were not accepted, check your form below !"
      render "wines/show"
    end
  end

  def destroy
    @wine = @tasting.wine
    @tasting.destroy
    redirect_to wine_path(@wine)
  end

  private

  def tasting_params
  end

  def visual_analysis_params
    params.require(:visual_analysis).permit(:color, :intensity, :nuance, :limpidity, :brightness, :density, :effervescence)
  end

  def olfactory_analysis_params
    params_permitted = params.require(:olfactory_analysis).permit(:intensity, :diversity, :quality, :olfactory_natures)
    if params_permitted[:olfactory_natures]
      params_permitted.delete :olfactory_natures
    end
    params_permitted
  end

  def gustatory_analysis_params
    params.require(:gustatory_analysis).permit(:acidity, :alcohol, :mellowness, :tannin_quantity, :tannin_quality)
  end

  def analysis_conclusion_params
    params.require(:analysis_conclusion).permit(:balance, :pai, :overall_sentiment, :future)
  end

  def build_olfactory_natures(olfactory_analysis, olfactory_natures)
    olfactory_natures.split(', ').each do |olfactory_nature|
      oflactory_analysis.olfacotry_natures.build(nature: olfactory_nature)
    end
  end

end
