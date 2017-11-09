structure Parse  =
struct 

structure MyCLrVals = MyCLrValsFun(structure Token = LrParser.Token)
structure Lex       = MyCLexFun(structure Tokens = MyCLrVals.Tokens)
structure MyCP      = Join(structure ParserData = MyCLrVals.ParserData
			   structure Lex=Lex
			   structure LrParser = LrParser)

fun parse() =
  let
      fun makeCLexer strm = MyCP.makeLexer (fn n => TextIO.inputN(strm,n))

      val makeFileLexer      = makeCLexer o TextIO.openIn
						   
      val lexer = case CommandLine.arguments() of
			  []  => makeCLexer TextIO.stdIn
		       |  [x] => makeFileLexer x
		       |  _   => (TextIO.output(TextIO.stdErr, "usage: c file"); OS.Process.exit OS.Process.failure)

      fun parseerror(s,p1,p2) = (print ("Error! "^ s ^"\t" ^ (Int.toString p1) ^ " " ^(Int.toString p2)^"\n"));
      
      val (absyn, _) = MyCP.parse(0,lexer,parseerror,())
  in
      absyn
  end

end
