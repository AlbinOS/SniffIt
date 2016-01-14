class ApplicationController < ActionController::Base
  # Authorization system
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:alert] = I18n.t("#{policy_name}.#{exception.query}", scope: "pundit", default: :default)
    redirect_to(request.referrer || root_path)
  end

  def resource_name
    controller_name.singularize
  end

  def resource_class
    eval(resource_name.capitalize)
  end

  def load_and_authorize_resource
    if ['new', 'create'].include?(params[:action].to_s)
      if 'create' == params[:action].to_s
        resource = resource_class.new(send("#{resource_name}_params"))
      else
        resource = resource_class.new
      end
    elsif params[:id]
      resource = resource_class.find(params[:id])
    else
      resource = nil
    end
    instance_variable_set("@#{resource_name}", resource)

    if resource.nil?
      authorize resource_class
    else
      authorize resource
    end
  end

  def remove_permitted_params(permitted_params, params_to_remove)
    params_to_remove.each do |param_to_remove|
      if permitted_params.key?(param_to_remove)
        permitted_params.delete param_to_remove
      end
    end
    permitted_params
  end

end
