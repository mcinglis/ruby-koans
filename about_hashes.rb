require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutHashes < EdgeCase::Koan
  def test_creating_hashes
    empty_hash = Hash.new
    assert empty_hash.is_a?(Hash)
    assert empty_hash.empty?
    assert_equal 0, empty_hash.size
  end

  def test_hash_literals
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.size
  end

  def test_accessing_hashes
    hash = { :one => "uno", :two => "dos" }
    assert_equal 'uno', hash[:one]
    assert_equal 'dos', hash[:two]
    assert hash[:doesnt_exist].nil?
  end

  def test_accessing_hashes_with_fetch
    hash = { :one => "uno" }
    assert_equal 'uno', hash.fetch(:one)
    assert_raise(KeyError) do
      hash.fetch(:doesnt_exist)
    end

    # THINK ABOUT IT:
    #
    # Why might you want to use #fetch instead of #[] when accessing hash keys?
    # Because we don't to allow the access of un-assigned keys to happen
    # silently - if a returned value from a hash is going to be null, we may
    # want to know about it!
  end

  def test_changing_hashes
    hash = { :one => "uno", :two => "dos" }
    hash[:one] = "eins"

    expected = { :one => 'eins', :two => "dos" }
    assert_equal expected, hash

    # Bonus Question: Why was "expected" broken out into a variable
    # rather than used as a literal?
    # Because hash literals are only accepted as the last argument of a
    # function, but the first argument of the assert statement is the
    # expected value.
  end

  def test_hash_is_unordered
    hash1 = { :one => "uno", :two => "dos" }
    hash2 = { :two => "dos", :one => "uno" }

    assert_equal hash1, hash2
  end

  def test_hash_keys
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.keys.size
    assert hash.keys.include?(:one)
    assert hash.keys.include?(:two)
    assert hash.keys.is_a?(Array)
  end

  def test_hash_values
    hash = { :one => "uno", :two => "dos" }
    assert_equal 2, hash.values.size
    assert hash.values.include?("uno")
    assert hash.values.include?("dos")
    assert hash.values.is_a?(Array)
  end

  def test_combining_hashes
    hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
    new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })

    assert_not_equal hash, new_hash

    expected = { "jim" => 54, "amy" => 20, "dan" => 23, "jenny" => 26 }
    assert_equal expected, new_hash
  end

  def test_default_value
    hash1 = Hash.new
    hash1[:one] = 1

    assert_equal 1, hash1[:one]
    assert hash1[:two].nil?

    hash2 = Hash.new("dos")
    hash2[:one] = 1

    assert_equal 1, hash2[:one]
    assert_equal 'dos', hash2[:two]
  end

  def test_default_value_is_the_same_object
    hash = Hash.new([])

    hash[:one] << "uno"
    hash[:two] << "dos"

    assert_equal ['uno', 'dos'], hash[:one]
    assert_equal ['uno', 'dos'], hash[:two]
    assert_equal ['uno', 'dos'], hash[:three]

    assert_same hash[:one], hash[:two]
  end

  def test_default_value_with_block
    hash = Hash.new {|hash, key| hash[key] = [] }

    hash[:one] << "uno"
    hash[:two] << "dos"

    assert_equal ['uno'], hash[:one]
    assert_equal ['dos'], hash[:two]
    assert_equal [], hash[:three]
  end
end
