{
open Parser
}

let white = [' ' '\t']+

rule read =
  parse
  | white { read lexbuf }
  | "+"   { ADD }
  | "-"   { SUB }
  | ">"   { INCR }
  | "<"   { DECR }
  | "."   { OUTPUT }
  | ","   { INPUT }
  | "["   { OPEN }
  | "]"   { CLOSE }
  | eof   { EOF }
  | _     { COMMENT }