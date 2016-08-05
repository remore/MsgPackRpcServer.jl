using MsgPackRpcServer
using Base.Test

module RemoteFunctions
  function hello()
    "hi from remote server"
  end

  function reverse(bool)
    !bool
  end

  function add(x, y)
    x+y
  end

  function array_map(a,b,c...)
    a=map([a,b,c...]) do x
      x*x
    end
    (a...)
  end

  function double_hash_count(h)
    h["count"] = h["count"]*h["count"]
    h
  end
end
@async MsgPackRpcServer.run(8080, RemoteFunctions)

sleep(1) # temporarily wait here until MsgPackRpcServer boot finished
run(`ruby test_client.rb`)
