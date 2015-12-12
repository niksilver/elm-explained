module UnionTypes where

-- A simple union type allows us to define an enumeration, like this

type Suit = Hearts | Diamonds | Clubs | Spades

{- In the above example we've defined the type Suit, but we've also
   defined the values Hearts, Diamonds, Clubs and Spades, and we can
   use them now, like in the REPL:

   > import UnionTypes
   > import UnionTypes exposing (..)
   > Hearts
   Hearts : UnionTypes.Suit
   >

   You can see that Hearts is a value of type Suit.
-}

-- Here's an example of using this

describe : Suit -> String
describe s
  = case s of
          Hearts -> "Red and bumpy"
          Diamonds -> "Red and pointy"
          Clubs -> "Black and bumpy"
          Spades -> "Black and pointy"

-- Note that the above won't compile if we miss out one of the suits,
-- because the compiler expects an exhaustive match.

