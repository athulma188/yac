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
  in
      TextIO.closeIn file;
  end

end
