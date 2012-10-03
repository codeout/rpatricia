require 'test/unit'
require 'rpatricia'

class TestShowNodes < Test::Unit::TestCase

  def test_nodes
    t = Patricia.new
    string = "pref_10"
    array = [:something]
    t.add("127.0.0.0/24")
    t.add("192.168.1.0/24")
    t.add("192.168.2.0/24")
    t.add("192.168.3.100")
    t.add("10.0.0.0/8", string)
    t.add("10.0.0.0/9", array)

    assert_equal({"10.0.0.0/8" => "pref_10",
                  "10.0.0.0/9" => [:something],
                  "127.0.0.0/24" => "",
                  "192.168.1.0/24" => "",
                  "192.168.2.0/24" => "",
                  "192.168.3.100/32" => ""},
                  t.nodes)

    assert(string.object_id != t.nodes["10.0.0.0/8"].object_id)
    assert(array.object_id == t.nodes["10.0.0.0/9"].object_id)
  end

end
