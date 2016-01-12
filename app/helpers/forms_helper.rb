module FormsHelper
  include I18nHelper

  class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Context
    include I18nHelper

    def full_text_field(attribute, options={})
      content_tag(:fieldset, class: 'form-group') do
        label_text = "#{active_record_attribute_i18n(@object.class, attribute)}" + (@object.errors[attribute].any? ? " (" + @object.errors[attribute].join(', ').downcase + ")" : "")

        options[:class] = 'form-control'
        label(attribute, label_text) + text_field(attribute, options)
      end
    end

    def full_number_field(attribute, options={})
      content_tag(:fieldset, class: 'form-group') do
        label_text = "#{active_record_attribute_i18n(@object.class, attribute)}" + (@object.errors[attribute].any? ? " (" + @object.errors[attribute].join(', ').downcase + ")" : "")

        options[:class] = 'form-control'
        label(attribute, label_text) + number_field(attribute, options)
      end
    end

    def full_select(attribute, selectable_options, options={}, html_options={})
      if html_options.key?(:multiple)
        html_options[:class] = 'form-control'
      else
        html_options[:class] = 'form-control c-select'
      end

      content_tag(:fieldset, class: 'form-group') do
        label(attribute, active_record_enum_caption_i18n(@object.class.name.underscore.to_sym, attribute)) + select(attribute, selectable_options, options, html_options)
      end
    end

    def full_submit(options={})
      if @object.persisted? 
        action_text = 'update'
      else
        action_text = 'create'
      end
      submit_text = "#{active_record_action_i18n(action_text)} #{active_record_i18n(@object.class)}"
      submit(submit_text, options)
    end
  end

  ActionView::Base.default_form_builder = BootstrapFormBuilder

  def full_text_field_for(object, attribute, options={})
    object_class_name_as_symbol = object.class.name.underscore.to_sym
    content_tag(:fieldset, class: 'form-group') do
      label_text = "#{active_record_attribute_i18n(object.class, attribute)}" + (object.errors[attribute].any? ? " (" + object.errors[attribute].join(', ').downcase + ")" : "")

      options[:class] = 'form-control'
      label(object_class_name_as_symbol, attribute, label_text) + text_field(object_class_name_as_symbol, attribute, options)
    end
  end

  def full_select_tag(object_as_symbol, attribute, selectable_options, options={})
    content_tag(:fieldset, class: 'form-group') do
      options[:class] = 'form-control c-select'
      options[:name] = "#{object_as_symbol}[#{attribute}]"
      label(object_as_symbol, active_record_enum_caption_i18n(object_as_symbol, attribute)) + select_tag(:"#{object_as_symbol}_#{attribute}", options_for_select(selectable_options), options)
    end
  end

end
