require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutObjects < EdgeCase::Koan
  def test_everything_is_an_object
    assert 1.is_a?(Object)
    assert 1.5.is_a?(Object)
    assert "string".is_a?(Object)
    assert nil.is_a?(Object)
    assert Object.is_a?(Object)
  end

  def test_objects_can_be_converted_to_strings
    assert_equal '123', 123.to_s
    assert_equal '', nil.to_s
  end

  def test_objects_can_be_inspected
    assert_equal '123', 123.inspect
    assert_equal 'nil', nil.inspect
  end

  def test_every_object_has_an_id
    assert Object.new.object_id.is_a?(Fixnum)
  end

  def test_every_object_has_different_id
    assert_not_equal Object.new.object_id, Object.new.object_id
  end

  def test_some_system_objects_always_have_the_same_id
    assert_equal 0, false.object_id
    assert_equal 2, true.object_id
    assert_equal 4, nil.object_id
  end

  def test_small_integers_have_fixed_ids
    assert_equal 1, 0.object_id
    assert_equal 3, 1.object_id
    assert_equal 5, 2.object_id
    assert_equal 201, 100.object_id

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?
    # i*2 + 1 ?
    # Found this helpful blog post on how Ruby represents common objects:
    # http://www.oreillynet.com/ruby/blog/2006/01/the_ruby_value_1.html
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    clone = obj.clone

    assert_not_same obj, clone
    assert_not_equal obj.object_id, clone.object_id
  end
end
