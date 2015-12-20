type operators =
  | Add | Sub | Incr | Decr | Output | Input

type instruction =
  | End
  | Simple of operators * instruction
  | Loop of instruction * instruction