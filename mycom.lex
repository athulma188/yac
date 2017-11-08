type pos = int
type svalue = Tokens.svalue;
type ('a,'b) token = ('a,'b) Tokens.token;
type lexresult  = (svalue,pos) token

val lineNum = ref 1
val linePos = ref [1]
