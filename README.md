An OCaml brainf**k interpreter
=====
Running the interpreter requires that you have ocamlbuild and utop (an OCaml toplevel) already set up on your computer. It also uses ocamllex, ocamlyacc, and menhir.

To use, simply use the command "ocamlbuild -use-menhir main.byte" to compile, then open utop and run "interp [command]"

For example: interp "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>." prints out "Hello World!"