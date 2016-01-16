class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_and_authorize_resource
  after_action :verify_authorized

  def show
  end
end
