module Main where

import AbstractSyntax (BoolExp (Gt), Comm (Assign, Input, Output, Seq, While), IntExp (Const, Div, Neg, Sum, Var))
import Semantics

-- programa de prueba. A partir de un numero entero en forma de input en la variable x, los numeros desde x a 0
testProgram :: Comm
testProgram =
  Input "x"
    `Seq` While
      (Gt (Var "x") (Const 0))
      (Output "x" `Seq` Assign "x" (Var "x" `Sum` Neg (Const 1)))

-- programa de prueba. divide por 0 y luego hace algo mas. Su proposito es mostrar que pasa cuando causamos un error en la ejecución
testProgram2 :: Comm
testProgram2 = Assign "x" (Const 12 `Div` Const 0) `Seq` Assign "x" (Sum (Var "x") (Const 1)) `Seq` Output "x"

main :: IO ()
main = interpret testProgram
