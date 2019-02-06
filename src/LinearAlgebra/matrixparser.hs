module LinearAlgebra.MatrixParser where

{-
GOAL: parse matrices on input, in the form of [[a]].
i.e. [[1,2],[3,4]]

we can allow for {} instead of [] too, possibly.
-}

import Data.Matrix

-- | Small parser library
import Text.Yoda

class Parsable a where
  mparser :: Parser a

-- list :: Parser [a]

-- useful parsers

whitespace :: Parser ()
whitespace = skip (many (oneOf [' ', '\t', '\n']))

token :: String -> Parser String
token t = string t <* whitespace

-- changed from Int to Integer, might break something
number :: Parser Integer
number = read <$> some (oneOf ['0'..'9']) <* whitespace

-- TODO parse doubles in a similar way to the above.
-- double :: Parser Double
-- double = read <$> some (oneOf ['0'..'9']))

word :: Parser String
word = some (oneOf ['a'..'z']) <* whitespace
