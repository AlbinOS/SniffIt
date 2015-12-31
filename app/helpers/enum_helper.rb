module EnumHelper

  def active_record_enum_list_i18n(active_record_class, attribute)
    active_record_class.send(attribute).map do |att, _|
      [I18n.t("#{active_record_class.model_name.i18n_key}.#{attribute}.#{att}"), att]
    end
  end

end
