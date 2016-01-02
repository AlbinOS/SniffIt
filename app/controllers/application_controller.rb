class ApplicationController < ActionController::Base
  # Authorization system
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

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
end
