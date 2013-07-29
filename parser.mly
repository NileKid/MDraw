%{ open Ast %}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA PLUS MINUS TIMES DIVIDE 
%token ASSIGN EQ NEQ LT LEQ GT GEQ RETURN IF ELSE ELSEIF FOR WHILE INT EOF 
%token <int> LITERAL
%token <string> ID

%nonassoc ELSEIF 
%nonassoc ELSE 
%right ASSIGN
%left EQ NEQ
%left LT GT LEQ GEQ %left PLUS MINUS %left TIMES DIVIDE

%start program
%type <Ast.program> program

%%