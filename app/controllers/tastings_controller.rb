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
    @tasting.olfactory_analysis.build_natures(:olfactory_natures, params.fetch(:olfactory_analysis, {}).fetch(:olfactory_natures, ''))
    @tasting.olfactory_analysis.build_natures(:retro_olfactory_natures, params.fetch(:olfactory_analysis, {}).fetch(:retro_olfactory_natures, ''))
    @tasting.build_gustatory_analysis(gustatory_analysis_params)
    @tasting.gustatory_analysis.build_natures(:gustatory_natures, params.fetch(:gustatory_analysis, {}).fetch(:gustatory_natures, ''))
    @tasting.build_analysis_conclusion(analysis_conclusion_params)
    @tasting.analysis_conclusion.build_natures(:dominant_gustatory_persistences, params.fetch(:analysis_conclusion, {}).fetch(:dominant_gustatory_persistences, ''))
    @tasting.analysis_conclusion.build_natures(:aftertaste_persistences, params.fetch(:analysis_conclusion, {}).fetch(:aftertaste_persistences, ''))

    if @tasting.save
      redirect_to [@wine, @tasting], notice: I18n.t('flashes.tastings.create', wine: @wine.full_name)
    else
      flash.now[:alert] = I18n.t('flashes.forms.not_accepted')
      render 'wines/show'
    end
  end

  def update
    @wine = @tasting.wine

    @tasting.visual_analysis.assign_attributes(visual_analysis_params)
    @tasting.olfactory_analysis.assign_attributes(olfactory_analysis_params)
    @tasting.olfactory_analysis.replace_natures(:olfactory_natures, params.fetch(:olfactory_analysis, {}).fetch(:olfactory_natures, ''))
    @tasting.olfactory_analysis.replace_natures(:retro_olfactory_natures, params.fetch(:olfactory_analysis, {}).fetch(:retro_olfactory_natures, ''))
    @tasting.gustatory_analysis.assign_attributes(gustatory_analysis_params)
    @tasting.gustatory_analysis.replace_natures(:gustatory_natures, params.fetch(:gustatory_analysis, {}).fetch(:gustatory_natures, ''))
    @tasting.analysis_conclusion.assign_attributes(analysis_conclusion_params)
    @tasting.analysis_conclusion.replace_natures(:dominant_gustatory_persistences, params.fetch(:analysis_conclusion, {}).fetch(:dominant_gustatory_persistences, ''))
    @tasting.analysis_conclusion.replace_natures(:aftertaste_persistences, params.fetch(:analysis_conclusion, {}).fetch(:aftertaste_persistences, ''))

    if @tasting.save
      redirect_to [@wine, @tasting], notice: I18n.t('flashes.tastings.update', wine: @wine.full_name)
    else
      flash.now[:alert] = I18n.t('flashes.forms.not_accepted')
      render 'wines/show'
    end
  end

  def destroy
    @wine = @tasting.wine
    @tasting.destroy

    redirect_to wine_path(@wine), notice: I18n.t('flashes.tastings.destroy', wine: @wine.full_name)
  end

  private

  def tasting_params
  end

  def visual_analysis_params
    params.fetch(:visual_analysis, {}).permit(:color, :intensity, :nuance, :limpidity, :brightness, :density, :effervescence)
  end

  def olfactory_analysis_params
    remove_permitted_params(params.fetch(:olfactory_analysis, {}).permit(:intensity, :diversity, :quality, :olfactory_natures, :retro_olfactory_natures), [:olfactory_natures, :retro_olfactory_natures])
  end

  def gustatory_analysis_params
    remove_permitted_params(params.fetch(:gustatory_analysis, {}).permit(:acidity, :alcohol, :mellowness, :tannin_quantity, :tannin_quality, :gustatory_natures), [:gustatory_natures])
  end

  def analysis_conclusion_params
    remove_permitted_params(params.fetch(:analysis_conclusion, {}).permit(:balance, :pai, :overall_sentiment, :future, :dominant_gustatory_persistences, :aftertaste_persistences), [:dominant_gustatory_persistences, :aftertaste_persistences])
  end

end
