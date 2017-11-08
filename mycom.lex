type pos = int
type svalue = Tokens.svalue;
type ('a,'b) token = ('a,'b) Tokens.token;
type lexresult  = (svalue,pos) token

val lineNum = ref 1
val linePos = ref [1]

fun eof() = let val pos = hd(!linePos) in Tokens.EOF(pos,pos) end


%%
  digits=[0-9]+;
%header (functor MyCLexFun (structure Tokens:MyC_TOKENS));


