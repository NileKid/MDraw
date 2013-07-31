{ open Parser}  (* Get the token types *)

rule token = parse
	[' ' '\t' '\r' '\n'] { token lexbuf }  (* Whitespace *)
| "/*"     { comment lexbuf }              (* Comments *)
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| ';'      { SEMI }
| ','      { COMMA }
| "."      { DOT }
| '+'      { PLUS }
| "++"     { DPLUS }
| '-'      { MINUS }
| "--"     { DMINUS }
| '*'      { TIMES }
| '/'      { DIVIDE }
| '='      { ASSIGN }
| "=="     { EQ }
| "!="     { NEQ }
| '<'      { LT }
| "<="     { LEQ }
| ">"      { GT }
| ">="     { GEQ }
| "if"     { IF }
| "else"   { ELSE }
| "elseif" { ELSEIF }
| "for"    { FOR }
| "while"  { WHILE }
| "return" { RETURN }
| "int"    { INT }
| "Point"  { POINT }
| "Line"   { LINE }
| "Curve"  { CURVE }
| ['0'-'9']+ as lxm { LITERAL(int_of_string lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }  (* End-of-comment *)
| _    { comment lexbuf }  (* Eat everything else *)


