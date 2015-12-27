module ApplicationHelper

  class LabellingFormBuilder < ActionView::Helpers::FormBuilder
    def full_text_field(attribute, options={})
      label(attribute) + ' ' + text_field(attribute)
    end 
  end

  ActionView::Base.default_form_builder = LabellingFormBuilder

end
