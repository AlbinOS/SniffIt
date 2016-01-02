module FormHelper

  class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    def full_text_field(attribute, options={})
      content_tag(:fieldset, class: 'form-group') do
        label_text = "#{attribute.capitalize}" + (@object.errors[attribute].any? ? " (" + @object.errors[attribute].join(', ').downcase + ")" : "")

        options[:class] = 'form-control'
        label(attribute, label_text) + text_field(attribute, options)
      end
    end

    def full_number_field(attribute, options={})
      content_tag(:fieldset, class: 'form-group') do
        label_text = "#{attribute.capitalize}" + (@object.errors[attribute].any? ? " (" + @object.errors[attribute].join(', ').downcase + ")" : "")

        options[:class] = 'form-control'
        label(attribute, label_text) + number_field(attribute, options)
      end
    end
  end
  
  ActionView::Base.default_form_builder = BootstrapFormBuilder

  def full_text_field_for(object, attribute, options={})
    object_class_name_as_symbol = object.class.name.downcase.to_sym
    content_tag(:fieldset, class: 'form-group') do
      label_text = "#{attribute.capitalize}" + (object.errors[attribute].any? ? " (" + object.errors[attribute].join(', ').downcase + ")" : "")
      
      options[:class] = 'form-control'
      label(object_class_name_as_symbol, attribute, label_text) + text_field(object_class_name_as_symbol, attribute, options)
    end
  end

  def full_select_tag(object_as_symbol, attribute, selectable_options, options={})
    content_tag(:fieldset, class: 'form-group') do
      options[:class] = 'form-control c-select'
      options[:name] = "#{object_as_symbol}[#{attribute}]"
      label(object_as_symbol, attribute) + select_tag(:"#{object_as_symbol}_#{attribute}", options_for_select(selectable_options), options)
    end
  end

end
