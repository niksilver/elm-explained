module UnionTypes where

-------------------------------------------------------------
-- Enumerations
-------------------------------------------------------------

-- A simple union type allows us to define an enumeration, like this

type Direction = North | East | South | West

{- In the above example we've defined the type Suit, but we've also
   defined the values North, East, South and West, and we can
   use them now, like in the REPL:

   > import UnionTypes exposing (..)
   > East
   East : UnionTypes.Direction
   >

   You can see that East is a value of type Direction.
-}

-- Here's an example of using this

describe : Direction -> String
describe dir
  = case dir of
          North -> "Cold"
          East -> "Arid"
          South -> "Hot"
          West -> "Humid"

-- Note that the above won't compile if we miss out one of the suits,
-- because the compiler expects an exhaustive match.

-------------------------------------------------------------
-- More elaborate union types
-------------------------------------------------------------

-- Union types also allow us to use more complex constructors.
-- The Character type is a simple enumeration, but
-- the Card type is a mix of tagged Value and tagged String types.

type Character = Ace | King | Queen | Jack
type Value = Pips Int | Name Character
type Card = Heart Value
    | Diamond Value
    | Club Value
    | Spade Value
    | Joker String

d10 = Diamond (Pips 10)
hking = Heart (Name King)
joker1 = Joker "Laughing Jeremy"

{- Let's look at the values' types:

   > import UnionTypes exposing (..)
   > d10
   Diamond (Pips 10) : UnionTypes.Card
   > hking
   Heart (Name King) : UnionTypes.Card
   > joker1
   Joker ("Laughing Jeremy") : UnionTypes.Card
   >

-}

