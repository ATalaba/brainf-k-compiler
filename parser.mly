%{
open Ast
%}

%token ADD
%token SUB
%token INCR
%token DECR
%token OUTPUT
%token INPUT
%token OPEN
%token CLOSE
%token EOF
%token COMMENT

%start <Ast.instruction> prog
%%

prog:
  | i = instruction; EOF {i}
  ;

instruction:
  | COMMENT; i = instruction { i }
  | COMMENT { End }
  | ADD; i = instruction { Simple (Add, i) }
  | ADD { Simple (Add, End) }
  | SUB; i = instruction { Simple (Sub, i) }
  | SUB { Simple (Sub, End) }
  | INCR; i = instruction { Simple (Incr, i) }
  | INCR { Simple (Incr, End) }
  | DECR; i = instruction { Simple (Decr, i) }
  | DECR { Simple (Decr, End) }
  | OUTPUT; i = instruction { Simple (Output, i) }
  | OUTPUT { Simple (Output, End) }
  | INPUT; i = instruction { Simple (Input, i) }
  | INPUT { Simple (Input, End) }
  | OPEN; i1 = instruction; CLOSE; i2 = instruction { Loop (i1, i2) }
  | OPEN; i1 = instruction; CLOSE { Loop (i1, End) }
  ;