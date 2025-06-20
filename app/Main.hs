module Main where

import AbstractSyntax (BoolExp (Gt), Comm (Assign, Input, Output, Seq, While), IntExp (Const, Neg, Sum, Var))
import Semantics

-- programa de prueba. A partir de un numero entero en forma de input en la variable x, los numeros desde x a 0
testProgram :: Comm
testProgram =
  Input "x"
    `Seq` While
      (Gt (Var "x") (Const 0))
      (Output "x" `Seq` Assign "x" (Var "x" `Sum` Neg (Const 1)))

main :: IO ()
main = interpret testProgram
