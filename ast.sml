structure Ast =
struct

datatype BinOp = PLUS | MINUS | TIMES | DIVIDE | EQ | NEQ | LT | LE | GT | GE  | AND | OR | MOD
datatype UnOp = UMINUS | NOT

datatype immutable = Int of int 
		  |  Float of real 
		  | String of string
		  | Char of string

datatype mutable = Var of string 
datatype funName = Fun of string
datatype Spec = Break | Continue | Return of mutable | Print of mutable
datatype typev = INTEGER | FLOATV | CHAR
	       
datatype Exp = NilExp
 	      |FunDecl of typev * funName * Exp list * Exp
	      |FunCall of funName * mutable list
	      |Declr of typev * mutable
	      |DecAss of typev * mutable * Exp	       
	      |Const of immutable
	      |Variable of mutable
	      |AssignExp of mutable * Exp
	      |SpecExp of Spec
	      |IfExp of Exp * Exp * Exp
	      |CompSt of Exp list
	      |WhileExp of Exp * Exp
	      |OpExp  of Exp * BinOp * Exp
	      |UnaExp of UnOp * Exp
	      |Param of typev * mutable
end
