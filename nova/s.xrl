Definitions.

INT        = [0-9]+
WORD       = [a-z_0-9]+
TYPE       = [A-Z][A-Za-z_0-9]+
WHITESPACE = [\s\t\n\r]
STRING = ".*?"

Rules.


mod           : {token, {mod,  TokenLine}}.
import        : {token, {import,  TokenLine}}.
where         : {token, {'where',  TokenLine}}.
let           : {token, {'let',  TokenLine}}.
then          : {token, {'then',  TokenLine}}.
as            : {token, {'as',  TokenLine}}.
case        : {token, {'case',  TokenLine}}.
type : {token, {'type',  TokenLine}}.

{TYPE}        : {token, {typename, TokenLine, TokenChars}}.
{STRING}      : {token, {string, TokenLine, TokenChars}}.
{INT}         : {token, {int,  TokenLine, TokenChars}}.
{WORD}        : {token, {atom, TokenLine, TokenChars}}.
\[            : {token, {'[',  TokenLine}}.
\]            : {token, {']',  TokenLine}}.
\{            : {token, {'{',  TokenLine}}.
\}            : {token, {'}',  TokenLine}}.
\(            : {token, {'(',  TokenLine}}.
\)            : {token, {')',  TokenLine}}.
\=            : {token, {'=',  TokenLine}}.
\->           : {token, {arrow,  TokenLine}}.
\.            : {token, {'.',  TokenLine}}.
,             : {token, {',',  TokenLine}}.
:             : {token, {':',  TokenLine}}.
\+             : {token, {'+',  TokenLine}}.
{WHITESPACE}+ : skip_token.



Erlang code.
