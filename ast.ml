type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq

type MDrawtree = 
   | Literaltree
   | Pointtree
   | linetree
   | curvetree
   | Layertree

type expr =
  | Literal of int
  | Dotop of string * string * expr list
  | Curve of expr * expr * expr * expr * expr * expr * expr * expr
  | Line of expr list 
  | Point of expr * expr
  | Layer of string list
  | Id of string
  | Binop of expr * op * expr
  | Assign of string * expr
  | Call of string * expr list
  | Noexpr

type stmt =
  | Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | While of expr * stmt

type var_decl = {
   t : MDrawtree;
   name : string;
   value : int list;
}

type func_decl = {
   return : MDrawtree;
   fname : string;
   formals : var_decl list;
   locals : var_decl list;
   body : stmt list;
}

type program = var_decl list * func_decl list

