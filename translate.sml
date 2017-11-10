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
				    | Ast.Return(Ast.Var(y)) => "return "^ y^";\n"
				    | Ast.Print(Ast.Var(y)) => "console.log("^y^");\n" 
			    )
  | compileExp (Ast.IfExp(x,y,z)) = let val elsepart = (compileExp z)
				    in
					if elsepart = ""
					then
					    "if (" ^ (compileExp x) ^ ")\n{\n" ^ (compileExp y) ^ "}\n"
					else
					    "if (" ^ (compileExp x) ^ ")\n{\n" ^ (compileExp y) ^ "}\nelse\n{\n"^elsepart^"}\n"
				    end
  | compileExp (Ast.CompSt(x)) = (compile x)
			       
  | compileExp (Ast.WhileExp (x,y)) = "while (" ^ (compileExp x) ^")\n{\n" ^  (compileExp y) ^"}\n"
				    
  | compileExp (Ast.Declr(x,Ast.Var(y))) = "var "^y^";\n"
				
  | compileExp (Ast.DecAss(x,Ast.Var(y),z)) = "var "^y^" = "^(compileExp z)^";\n"
				
  | compileExp (Ast.OpExp(x,y,z)) =  (case y of
				    Ast.PLUS =>  (compileExp x) ^ "+" ^ (compileExp z)
				   | Ast.MINUS => (compileExp x) ^ "-" ^ (compileExp z)
				   | Ast.TIMES => (compileExp x) ^ "*" ^ (compileExp z)
				   | Ast.DIVIDE => (compileExp x) ^ "/" ^ (compileExp z)
				   | Ast.MOD => (compileExp x) ^ "%" ^ (compileExp z)
				   | Ast.AND => (compileExp x) ^ "&&" ^ (compileExp z)
				   | Ast.OR => (compileExp x) ^ "||" ^ (compileExp z)
				   | Ast.EQ => (compileExp x) ^ "==" ^ (compileExp z)
				   | Ast.NEQ => (compileExp x) ^ "!=" ^ (compileExp z)
				   | Ast.GE => (compileExp x) ^ ">=" ^ (compileExp z)
				   | Ast.LE => (compileExp x) ^ "<=" ^ (compileExp z)
				   | Ast.LT => (compileExp x) ^ "<" ^ (compileExp z)
				   | Ast.GT => (compileExp x) ^ ">" ^ (compileExp z)
			       )
			
  | compileExp (Ast.UnaExp(x,y)) = (case  x of
				  Ast.UMINUS => "-" ^ (compileExp y)
				| Ast.NOT => "!"^ (compileExp y)
			     )		 

  | compileExp (Ast.NilExp) = "" 

  | compileExp (Ast.FunDecl(x,Ast.Fun(y),z,w)) =  "function " ^ y ^ "("^(compileParam z)^")\n{\n"^(compileExp w)^"}\n"
  | compileExp (Ast.Param(x,Ast.Var(y))) = y
  | compileExp (Ast.FunCall(Ast.Fun(x),y)) = x^"("^(compileIds y)   ^")" 
				
and compileParam (x::xs) = if List.null xs
			   then
			       (compileExp x)
			   else
			       (compileExp x) ^ ", "^ (compileParam xs)
  | compileParam [] = ""
and compileIds (Ast.Var(x)::xs) = if List.null xs
				  then
				      x
				  else
				      x ^ ", "^ (compileIds xs)
						    
  | compileIds [] = ""
end
