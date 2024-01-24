Nonterminals expr elems elem exprs root value access then_pipe right_expr case_expr 
  case_exprs atoms type_definition type_statement type_statements typelist 
  type_params type_param constructors constructor fields field
  pattern expr_list operation.
Terminals ',' atom '{' '}' 'import' '=' 'let' 'mod' '.' '(' ')' string 'then' 'case' '->' 'arrow' typename 'type' ':' int '-' '+' '*' '/'.
Rootsymbol root.


root -> 'import' elems : {'import', '$2'}.
root -> 'mod' atom '{' exprs '}' : {'mod', '$1', '$2'}.
root -> 'let' atom '=' right_expr : {'let', '$2', '$4'}.
root -> 'type' type_definition '{' constructors '}' : {'type', '$2', '$4'}.
root -> 'type' type_definition : {'type', '$2', [], []}.

root -> expr : '$1'.

right_expr -> then_pipe : {'then_pipe', '$1'}.
right_expr -> expr : '$1'.

expr -> value '(' expr_list ')' : {'call', '$1', '$3'}.
expr -> value : '$1'.
expr -> 'case' value '{' case_exprs '}' : {'case', '$2', '$4'}.
expr -> atom ':' right_expr : {'lambda', '$1', '$3'}.
expr -> value operation value : {'operation', '$1', '$2', '$3'}.

operation -> '-' : '$1'.
operation -> '+' : '$1'.
operation -> '*' : '$1'.
operation -> '/' : '$1'.

pattern -> value : {'value', '$1'}.
pattern -> typename '(' atoms ')' : {'value', '$1', '$3'}.
pattern -> typename : {'value', '$1'}.
 
case_expr -> pattern 'arrow' expr : {'case_expr', '$1', '$3'}.

case_exprs -> case_expr : ['$1']. 
case_exprs -> case_expr case_exprs : ['$1'| '$2']. 


then_pipe -> expr 'then' then_pipe : ['$1'| '$3']. 
then_pipe -> expr 'then' expr : ['$1'| '$3']. 

value -> access : '$1'.
value -> string : {'const', 'string', '$1'}. 
value -> int : {'const', 'int', '$1'}. 
value -> atom : {'var', '$1'}. 

access -> atom '.' access : {'access', ['$1' |'$3']}.
access -> atom '.' atom : {'access', ['$1' |'$3']}.

exprs -> expr : ['$1'].
exprs -> expr exprs : {'expr_block', ['$1', '$2']}.

expr_list -> expr : ['$1'].
expr_list -> expr ',' expr_list : ['$1' |'$3'].

elems -> elem           : ['$1'].
elems -> elem ',' elems : ['$1'|'$3'].

elem -> atom : extract_token('$1').
elem -> string : '$1'.

atoms -> atom           : ['$1'].
atoms -> atom ',' atoms : ['$1'|'$3'].

type_definition -> typename '(' atoms ')' : {'typedef', '$1', $3}.
type_definition -> typename : {'typedef', '$1', []}.

typelist -> typename  : ['$1'].
typelist -> typename ',' typelist  : ['$1'|'$3'].

field -> atom ':' typename '(' typelist ')' : {'field', '$1', '$3', '$5'}. 
field -> atom ':' typename '(' atoms ')' : {'field', '$1', '$3', '$5'}. 
field -> atom ':' typename : {'field', '$1', '$3'}. 
field -> atom ':' atom : {'field', '$1', '$3'}. 

fields -> field : ['$1'].
fields -> field ',' fields : ['$1'|'$3'].

constructor -> typename '(' fields ')' : {'constructor', '$1', '$3'}.
constructor -> typename : {'constructor', '$1', []}.

constructors -> constructor : ['$1'].
constructors -> constructor constructors : ['$1'|'$2'].


Erlang code.

extract_token({_Token, _Line, Value}) -> Value.
