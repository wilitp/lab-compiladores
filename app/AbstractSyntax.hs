module AbstractSyntax
  ( Identifier,
    IntExp (..),
    BoolExp (..),
    Comm (..),
  )
where

type Identifier = String

data IntExp
  = Var Identifier
  | Const Int
  | Neg IntExp
  | Sum IntExp IntExp
  | Prod IntExp IntExp
  | Div IntExp IntExp
  | Rem IntExp IntExp

data BoolExp
  = TTrue
  | FFalse
  | Eq IntExp IntExp
  | Neq IntExp IntExp
  | Gt IntExp IntExp
  | Lt IntExp IntExp
  | Or BoolExp BoolExp
  | And BoolExp BoolExp
  | Not BoolExp

data Comm
  = Skip
  | Assign Identifier IntExp
  | Seq Comm Comm
  | IfElse BoolExp Comm Comm
  | While BoolExp Comm
  | Input Identifier
  | Output Identifier
