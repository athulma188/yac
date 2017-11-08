structure Parse  =
struct 

structure MyCLrVals = MyCLrValsFun(structure Token = LrParser.Token)
structure Lex       = MyCLexFun(structure Tokens = MyCLrVals.Tokens)
structure MyCP      = Join(structure ParserData = MyCLrVals.ParserData
			   structure Lex=Lex
			   structure LrParser = LrParser)




end
