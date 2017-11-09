structure Translate =
struct

fun compile (x::xs) = (compileExp x) ^ (compile xs)
  | compile [] = "" 

and compileExp (Ast.Const(x)) = (case x of
			       Ast.Int(y) =>  (Int.toString y)
			   | Ast.Float(y) =>  (Real.toString y) 
			   | Ast.String(y) =>  "\""^y^"\""
			   | Ast.Char(y) =>  "'"^y^"'"
			  )
  | compileExp (Ast.Variable(Ast.Var(x))) = x

  | compileExp (Ast.AssignExp(Ast.Var(x),y)) = x^" = " ^ (compileExp y)^";\n"
					     
  | compileExp (Ast.SpecExp(x)) = (case x of
				   Ast.Break => "break;\n"
				| Ast.Continue => "continue;\n"
			    )
				
		     
end
