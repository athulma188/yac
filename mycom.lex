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

%%
"+"     => (Tokens.PLUS(yypos,yypos+1));
"-"     => (Tokens.MINUS(yypos,yypos+1));
"*"     => (Tokens.TIMES(yypos,yypos+1));
"/"     => (Tokens.DIVIDE(yypos,yypos+1));
"%"     => (Tokens.MOD(yypos,yypos+1));
","     => (Tokens.COMMA(yypos,yypos+1));
"&&"    => (Tokens.AND(yypos,yypos+1));
"||"    => (Tokens.OR(yypos,yypos+1));

