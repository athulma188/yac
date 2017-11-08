structure Parse  =
struct 

structure MyCLrVals = MyCLrValsFun(structure Token = LrParser.Token)
structure Lex       = MyCLexFun(structure Tokens = MyCLrVals.Tokens)
structure MyCP      = Join(structure ParserData = MyCLrVals.ParserData
			   structure Lex=Lex
			   structure LrParser = LrParser)

fun parse filename =
  let
      val file = TextIO.openIn filename
      fun get _ = TextIO.input file
      val lexer = LrParser.Stream.streamify(Lex.makeLexer get)
      fun parseerror(s,p1,p2) = (print ("Error! "^ s ^"\t" ^ (Int.toString p1) ^ " " ^(Int.toString p2)^"\n"));
      val (absyn, _) = MyCP.parse(0,lexer,parseerror,())
  in
      TextIO.closeIn file;
      absyn
  end

end
