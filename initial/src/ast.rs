pub struct Module {}

pub enum Ast {
    //let x = a
    //let {a,b} = a
    Definition(Pattern, Expression),
    //
    Expression(Expression),
    Function(),
    Imports(),
    // namespace
    Module(), 
    // type {}
    Enum(),
    // struct {}
    Struct()
}

pub enum Expression {
 Call(Box<Expression>, Vec<Expression>),
 Operation(Box<Expression>, Box<Expression>),
}

pub enum Pattern {}


pub enum Type {
}


