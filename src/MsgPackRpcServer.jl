module MsgPackRpcServer

using MsgPack

run(port,m) = begin
  server = listen(port)
  while true
    conn = accept(server)
    line = ""
  #  @async begin
      try
        while true
          line = string(line, MsgPack.unpack(conn))
          if sizeof(line)>0
            args = eval(parse(line))
            evaluated = eval(m, Expr(:call, parse(args[3]), args[4]...))
            #println(evaluated)
            write(conn, MsgPack.pack([1,args[2],nothing,evaluated]))
            line = ""
          end
        end
      catch err
        #print("connection ended with error $err")
      end
  #  end
    close(conn)
  end
end

end # module
