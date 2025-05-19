import AbstractSyntax (BoolExp (..), Comm (..), IntExp (..))
import Control.Applicative (Applicative (liftA2))
import qualified State as St

-- Integers
intexp :: IntExp -> St.State -> Int
intexp (Var var) = flip St.evalState var
intexp (Const n) = const n
intexp (Neg e) = (0 -) . intexp e
intexp (Sum e1 e2) = liftA2 (+) (intexp e2) (intexp e1)
intexp (Prod e1 e2) = liftA2 (*) (intexp e2) (intexp e1)
intexp (Div e1 e2) = liftA2 div (intexp e2) (intexp e1)
intexp (Rem e1 e2) = liftA2 mod (intexp e2) (intexp e1)

-- Booleans
boolexp :: BoolExp -> St.State -> Bool
boolexp TTrue = const True
boolexp FFalse = const False
boolexp (And b1 b2) = liftA2 (&&) (boolexp b1) (boolexp b2)
boolexp (Or b1 b2) = liftA2 (||) (boolexp b1) (boolexp b2)
boolexp (Not b) = not . boolexp b
boolexp (Eq e1 e2) = liftA2 (==) (intexp e1) (intexp e2)
boolexp (Neq e1 e2) = liftA2 (/=) (intexp e1) (intexp e2)
boolexp (Gt e1 e2) = liftA2 (>) (intexp e1) (intexp e2)
boolexp (Lt e1 e2) = liftA2 (<) (intexp e1) (intexp e2)

-- Commands

comm :: Comm -> St.State -> St.State
comm Skip state = state
comm (Assign var e) state = St.updateState var (intexp e state) state
comm (Seq c1 c2) state = comm c2 . comm c1 $ state
comm (IfElse b c1 c2) state = comm c state
  where
    c = if boolexp b state then c1 else c2
comm (While b c) state =
  if boolexp b state
    then comm (While b c) (comm c state)
    else state
