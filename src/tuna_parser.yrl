Nonterminals list elements element.

Terminals atom float integer '(' ')'.

Rootsymbol list.

list -> '(' ')'.
list -> '(' elements ')'.
elements -> element.
elements -> element elements.
element -> atom.
element -> list.
