module I18nHelper

  def active_record_action_i18n(action)
    I18n.t("actions.#{action}")
  end

  def active_record_i18n(active_record_class)
    I18n.t("activerecord.models.#{active_record_class.model_name.i18n_key}")
  end

  def active_record_attribute_i18n(active_record_class, attribute)
    I18n.t("#{active_record_class.model_name.i18n_key}.#{attribute}")
  end

  def active_record_enum_caption_i18n(model_name, attribute)
    I18n.t("#{model_name}.#{attribute}")
  end

  def active_record_enum_list_i18n(active_record_class, attribute)
    active_record_class.send(attribute).map do |att, _|
      [I18n.t("#{active_record_class.model_name.i18n_key}.#{attribute}.#{att}"), att]
    end
  end

end
