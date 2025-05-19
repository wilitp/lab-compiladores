module Main where

import AbstractSyntax ()
import qualified Data.Map as Map
import Data.Maybe

test :: String
test =
  Data.Maybe.fromMaybe
    "Nada!"
    (Map.lookup "hola" $ Map.insert "hola" "chau" Map.empty)

main :: IO ()
main = putStrLn test
