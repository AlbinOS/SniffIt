class WinesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_and_authorize_resource
  after_action :verify_authorized

  def index
    @wines = Wine.all
  end

  def show
    @tasting = @wine.tastings.build
  end

  def new
    @grapes = Grape.all
  end

  def edit
    @grapes = Grape.all
  end

  def create
    @wine.user = current_user
    if @wine.save
      redirect_to @wine, notice: I18n.t('flashes.wines.create', wine: @wine.full_name)
    else
      @grapes = Grape.all
      flash.now[:alert] = I18n.t('flashes.forms.not_accepted')
      render 'new'
    end
  end

  def update
    if @wine.update(wine_params)
      redirect_to @wine, notice: I18n.t('flashes.wines.update', wine: @wine.full_name)
    else
      @grapes = Grape.all
      flash.now[:alert] = I18n.t('flashes.forms.not_accepted')
      render 'edit'
    end
  end

  def destroy
    @wine.destroy

    redirect_to wines_path, notice: I18n.t('flashes.wines.destroy', wine: @wine.full_name)
  end

  private

  def wine_params
    params_permitted = params.require(:wine).permit(:color, :appellation, :vintage, :domaine, :alcohol_rate, :vinification_type, grapes: [])
    if params_permitted[:grapes]
      params_permitted[:grapes] = params_permitted[:grapes].reject(&:blank?).collect { |g| Grape.find_by_id(Integer(g))  }
    end
    params_permitted
  end
end
