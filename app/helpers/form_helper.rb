module FormHelper

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

  def full_text_field(object, attribute, options={})
    object_class_name_as_symbol = object.class.name.downcase.to_sym
    content_tag(:fieldset, class: 'form-group') do
      label_text = "#{attribute.capitalize}" + (object.errors[attribute].any? ? " (" + object.errors[attribute].join(', ').downcase + ")" : "")
      label(object_class_name_as_symbol, attribute, label_text) + text_field(object_class_name_as_symbol, attribute, options)
    end
  end

end
