structure Ast =
struct

datatype BinOp = PLUS | MINUS | TIMES | DIVIDE | EQ | NEQ | LT | LE | GT | GE  | AND | OR | MOD
datatype UnOp = UMINUS | NOT

datatype immutable = Int of int 
		  |  Float of real 
		  | String of string

datatype mutable = Var of string

datatype Spec = Break

datatype typev = INTEGER | FLOATV | CHAR
		    
end
