# MessagePack RPC Server for Julia

A Julia implementation of MessagePack-RPC Server Library. 

## Usage

Write some code using MsgPackRpcServer:

```
import MsgPackRpcServer

module RemoteFunctions
  function add(x, y)
    x+y
  end
end

@async MsgPackRpcServer.run(8080, RemoteFunctions)
```

and run `ruby -r msgpack-rpc -e "p MessagePack::RPC::Client.new('127.0.0.1', 8080).call(:add, 2, 3)"`` then you will get `5` calculated by Julia.

## Limitations

As of v0.0.1, only very basic synchronous rpc call on TCP Socket is implemented. Following features are to be supported in the future.

- Asynchronous Call
- Multiple Transports such as UDP, UNIX domain socket
- High Performance Capability such as single-threaded model or event-driven architecture etc.

## License

MIT

## Reference

- (MessagePack-RPC Specification)[https://github.com/msgpack-rpc/msgpack-rpc/blob/master/spec.md]
- (MessagePack specification)[https://github.com/msgpack/msgpack/blob/master/spec.md]
