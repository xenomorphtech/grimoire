["s.erl", "some.erl", "s.beam", "some.beam"] |> Enum.each(& File.rm(&1))

:leex.file('s.xrl')
:compile.file('s')
:code.load_file(:s)

:yecc.file('some.yrl')
:compile.file('some')
:code.load_file(:some)

defmodule CC do
def  parse(s) do
{:ok, tokens, _} = IO.inspect(:s.string(s |> :binary.bin_to_list()), limit: :infinity, pretty: true)

{:ok, _} = IO.inspect(:some.parse(tokens), pretty: true)
end
end


# a call with a few parameters 
CC.parse(~s'list.each(e, 1, "")')

# a call with a lambda
CC.parse(~s'
 list.each(e,
    val:  
     cc.emit_erlang(val) 
      then cc.file_write(val.name + ".erl", _)
    
  )')

CC.parse("type Result")

CC.parse("type Result { Solo Other }")

CC.parse("type Result { Solo(a : Int) Other }")

CC.parse("type Result(a) { Solo(b: c) Other }")

CC.parse("type Result(a, c) { Solo(a: a, b: String) Other YetAnother(x: c) SomeMore }")

CC.parse("type Result(a, b) {
Ok(val: a)
Error(eval: b)
}")

CC.parse(~s'ca.cb.cc')

CC.parse(~s'ca.cb.cc("a")')

CC.parse("import cc, cc1")

CC.parse(~s{let something = 
   cc.file_read("something.nt3") 
      then cc.parse 
      then cc.type_check
})

CC.parse(~s[
let something = 
 case something {
 error -> cc.report(e) 
 ok -> cc.report(e)
}
])

CC.parse(~s[
let something = 
 case something {
   Error(e) -> cc.report(e) 
   everything ->
     nil
 }
])

CC.parse(~s[
let something = 
 case something {
 Error(e) -> cc.report(e) 
 Ok(e) ->
  list.each(e, 
    val:  
     cc.emit_erlang(val) 
      then cc.file_write(val.name + ".erl", _)
  )
}
])


CC.parse(~s[
mod something {
  
}
])


