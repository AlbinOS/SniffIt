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
      redirect_to @wine
    else
      flash.now[:alert] = "Your data were not accepted, check your form below !"
      render 'new'
    end
  end

  def update
    if @wine.update(wine_params)
      redirect_to @wine
    else
      flash.now[:alert] = "Your data were not accepted, check your form below !"
      render 'edit'
    end
  end

  def destroy
    @wine.destroy

    redirect_to wines_path
  end

  private

  def wine_params
    params_permitted = params.require(:wine).permit(:appellation, :vintage, :domaine, :alcohol_rate, :vinification_type, grapes: [])
    if params_permitted[:grapes]
      params_permitted[:grapes] = params_permitted[:grapes].reject(&:blank?).collect { |g| Grape.find_by_id(Integer(g))  }
    end
    params_permitted
  end
end
