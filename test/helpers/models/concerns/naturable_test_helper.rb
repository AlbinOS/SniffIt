module NaturableTestHelper
  def assert_build_natures(active_record_class, nature_type, active_record_class_params={})
    active_record_object = active_record_class.new(active_record_class_params)
    active_record_object.build_natures(nature_type, 'Nature, Nature2 nature2, nature3')
    assert active_record_object.save
    assert_equal 3, active_record_object.send(nature_type).count
    assert_equal 'Nature3', active_record_object.send(nature_type).last.nature
  end

  def assert_natures(active_record_class, nature_type, active_record_class_params={})
    active_record_object = active_record_class.new(active_record_class_params)
    active_record_object.send(nature_type).build(nature: 'Nature')
    active_record_object.send(nature_type).build(nature: 'Nature2 nature2')
    active_record_object.send(nature_type).build(nature: 'Nature3')
    assert_equal 'Nature, Nature2 nature2, Nature3', active_record_object.natures(nature_type)
  end

  def assert_erase_natures(active_record_class, nature_type, active_record_class_params={})
    active_record_object = active_record_class.new(active_record_class_params)
    active_record_object.send(nature_type).build(nature: 'Nature')
    active_record_object.send(nature_type).build(nature: 'Nature2 nature2')
    active_record_object.send(nature_type).build(nature: 'Nature3')
    assert active_record_object.save
    assert_equal 3, active_record_object.send(nature_type).count
    active_record_object.erase_natures(nature_type)
    assert_equal 0, active_record_object.send(nature_type).count
  end

  def assert_replace_natures(active_record_class, nature_type, active_record_class_params={})
    active_record_object = active_record_class.new(active_record_class_params)
    active_record_object.send(nature_type).build(nature: 'Nature')
    active_record_object.send(nature_type).build(nature: 'Nature2 nature2')
    active_record_object.send(nature_type).build(nature: 'Nature3')
    assert active_record_object.save
    assert_equal 3, active_record_object.send(nature_type).count
    active_record_object.replace_natures(nature_type, 'Nature, Nature3')
    assert active_record_object.save
    assert_equal 2, active_record_object.send(nature_type).count
  end

  def assert_replace_natures_no_action_if_equal(active_record_class, nature_type, active_record_class_params={})
    active_record_object = active_record_class.new(active_record_class_params)
    nature1 = active_record_object.send(nature_type).build(nature: 'Nature')
    nature2 = active_record_object.send(nature_type).build(nature: 'Nature2')
    assert active_record_object.save
    assert_equal 2, active_record_object.send(nature_type).count
    active_record_object.replace_natures(nature_type, 'Nature, Nature2')
    assert active_record_object.save
    assert_equal 2, active_record_object.send(nature_type).count
    assert_equal nature1.id, active_record_object.send(nature_type).first.id
    assert_equal nature2.id, active_record_object.send(nature_type).second.id
  end

  def assert_all_natures(active_record_class, nature_type, active_record_class_params={})
    assert_build_natures(active_record_class, nature_type, active_record_class_params)
    assert_natures(active_record_class, nature_type, active_record_class_params)
    assert_erase_natures(active_record_class, nature_type, active_record_class_params)
    assert_replace_natures(active_record_class, nature_type, active_record_class_params)
    assert_replace_natures_no_action_if_equal(active_record_class, nature_type, active_record_class_params)
  end

end
