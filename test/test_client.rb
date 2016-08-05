require 'msgpack/rpc'
require 'test/unit'

class RpcCall < Test::Unit::TestCase

  def setup
    @cli = MessagePack::RPC::Client.new("127.0.0.1", 8080)
    @cli.timeout = 5
  end
  
  def teardown
    @cli.close
  end

  def test_rpc_string
    assert_equal("hi from remote server", @cli.call(:hello))
  end

  def test_rpc_numeric_operation
    x = 2028
    y = 5.20
    assert_equal(x+y, @cli.call(:add, x, y))
  end

  def test_rpc_array_operation
    x = 2
    y = 5.64543
    z = 4324
    assert_equal([x,y,z].map{|e| e*e}, @cli.call(:array_map, x,y,z))
  end

  def test_rpc_bool_operation
    assert_equal(false, @cli.call(:reverse, true))
  end

  def test_rpc_hash_operation
    assert_equal({"count"=>123*123}, @cli.call(:double_hash_count,{"count"=>123}))
  end 
end

