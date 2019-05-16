Definitions.
% Examples here https://github.com/relops/leex_yecc_example/tree/master/src

DIGITS              =  [0-9]
ALPHABET            =  [A-Za-z]
ALPHABET_LOWERCASE  =  [a-z]
COMPARISON          =  (<|>|=>|<=|==|<=>)
OPERATORS           =  (/|\*|\%|\+|-|\*\*|<<|>>|::)
DELIMITERS          =  ([(),=\[\]}!]|\%{|\@\[)
RESERVED_WORDS      =  (while|for|in|loop|break|continue|pr|attr|class|new|fn)

Rules.

{DIGITS}+                                      :  {token,{integer,TokenLine,list_to_integer(TokenChars)}}.

{DIGITS}+\.{DIGITS}+((E|e)(\+|\-)?{DIGITS}+)?  :  {token,{float,TokenLine,list_to_float(TokenChars)}}.

\"((:""|[^"])*)\"                              :  {token, {string, TokenLine, TokenChars}}.

\'((:''|[^'])*)\'                              :  {token, {string, TokenLine, TokenChars}}.

true                                           :  {token, {bool, TokenLine, true}}.

false                                          :  {token, {bool, TokenLine, false}}.

{DELIMITERS}                                   :  {token, {list_to_atom(TokenChars), TokenLine}}.

{COMPARISON}                                   :  {token, {comparator,TokenLine,list_to_atom(TokenChars)}}.

{OPERATORS}                                    :  {token, {operator, TokenLine, list_to_atom(TokenChars)}}.

{RESERVED_WORDS}                               :  {token, {list_to_atom(TokenChars), TokenLine}}.

Erlang code.
