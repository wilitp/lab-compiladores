module State
  ( State,
    updateState,
    stateFromList,
    emptyState,
    evalState,
  )
where

import qualified AbstractSyntax as Syntax
import qualified Data.Map as Map
import Data.Maybe (fromMaybe)

type State = Map.Map String Int

updateState :: Syntax.Identifier -> Int -> State -> State
updateState = Map.insert

stateFromList :: [(String, Int)] -> State
stateFromList = Map.fromList

emptyState :: State
emptyState = Map.empty

evalState :: State -> Syntax.Identifier -> Int
evalState state var = fromMaybe (error $ "Variable " ++ var ++ " not defined") $ Map.lookup var state
