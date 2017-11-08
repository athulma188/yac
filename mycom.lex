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
"=="    => (Tokens.EQ(yypos,yypos+1));
">="    => (Tokens.GE(yypos,yypos+2));
">"     => (Tokens.GT(yypos,yypos+1));
"<="    => (Tokens.LE(yypos,yypos+2));
"<"     => (Tokens.LT(yypos,yypos+1));
"!="    => (Tokens.NEQ(yypos,yypos+2));
";"     => (Tokens.SEMICOLON(yypos,yypos+1));
"="    => (Tokens.ASSIGN(yypos,yypos+2));
"{"     => (Tokens.LBRACE(yypos,yypos+1));
"}"     => (Tokens.RBRACE(yypos,yypos+1));
"("     => (Tokens.LPAREN(yypos,yypos+1));
")"     => (Tokens.RPAREN(yypos,yypos+1));
"break" => (Tokens.BREAK(yypos,yypos+5));
"if"  => (Tokens.IF(yypos,yypos+2));
"continue" => (Tokens.CONTINUE(yypos,yypos+8));
"else" => (Tokens.ELSE(yypos,yypos+4));
"for" => (Tokens.FOR(yypos,yypos+3));
"while" =>(Tokens.WHILE(yypos,yypos+5));
"int"   =>(Tokens.INTEGER(yypos,yypos+3));
"float"   =>(Tokens.FLOATV(yypos,yypos+5));
"char"   =>(Tokens.CHAR(yypos,yypos+4));
{digits}=> (Tokens.INT(Option.getOpt(Int.fromString yytext,0),yypos,yypos+size yytext));
[digits]\.[digits] => (Tokens.FLOAT(Option.getOpt(Real.fromString yytext,0),yypos,yypos+size yytext));
[a-z][a-z0-9]* => (Tokens.ID(yytext,yypos,yypos+size yytext));
"\n"	=> (lineNum := !lineNum+1; linePos := yypos :: !linePos; continue());
" "   => (continue());
"\t"   => (continue());



