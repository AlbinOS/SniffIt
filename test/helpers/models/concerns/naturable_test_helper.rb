module NaturableTestHelper
  def build_natures(active_record_object, nature_type)
    active_record_object.build_natures(nature_type, 'Nature, Nature2 nature2, nature3')
    assert active_record_object.save
    assert_equal 3, active_record_object.send(nature_type).count
    assert_equal 'Nature3', active_record_object.send(nature_type).last.nature
  end
end
