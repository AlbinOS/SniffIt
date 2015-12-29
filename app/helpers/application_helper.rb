module ApplicationHelper

  class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    def full_text_field(attribute, options={})
      content_tag(:fieldset, class: 'form-group') do
        label_text = "#{attribute.capitalize}" + (@object.errors[attribute].any? ? " (" + @object.errors[attribute].join(', ').downcase + ")" : "")
        label(attribute, label_text) + text_field(attribute, options)
      end
    end

    def full_number_field(attribute, options={})
      content_tag(:fieldset, class: 'form-group') do
        label_text = "#{attribute.capitalize}" + (@object.errors[attribute].any? ? " (" + @object.errors[attribute].join(', ').downcase + ")" : "")
        label(attribute, label_text) + number_field(attribute, options)
      end
    end
  end
  
  ActionView::Base.default_form_builder = BootstrapFormBuilder

end
