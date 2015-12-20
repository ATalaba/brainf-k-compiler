open Ast

let rec eval cells place instruct = match instruct with
  | End                 -> ()
  | Simple (Add, i)     -> cells.(!place) <- (cells.(!place) + 1); eval cells place i
  | Simple (Sub, i)     -> cells.(!place) <- (cells.(!place) - 1); eval cells place i
  | Simple (Incr, i)    -> incr place; eval cells place i
  | Simple (Decr, i)    -> decr place; eval cells place i
  | Simple (Output, i)  -> print_char (Char.chr cells.(!place)); eval cells place i
  | Simple (Input, i)   -> cells.(!place) <- Char.code (input_char stdin); eval cells place i
  | Loop (i1, i2)       -> if cells.(!place) = 0
                           then eval cells place i2
                           else
                            let rec loop cells place instruct =
                              eval cells place instruct;
                              if cells.(!place) = 0
                              then ()
                              else loop cells place instruct
                           in
                           loop cells place i1; eval cells place i2


let parse s =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast

let interp e =
  e |> parse |> eval (Array.make 1000 0) (ref 0)