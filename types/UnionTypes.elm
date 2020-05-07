module UnionTypes exposing (..)


-- Enumerations

type Direction = North | East | South | West

describe : Direction -> String
describe dir =
  case dir of
    North -> "Cold"
    East -> "Arid"
    South -> "Hot"
    West -> "Humid"


-- More elaborate union types

type Character = Ace | King | Queen | Jack
type Value = Pips Int | Name Character
type Card =
  Heart Value
  | Diamond Value
  | Club Value
  | Spade Value
  | Joker String

d10 = Diamond (Pips 10)
hking = Heart (Name King)
joker1 = Joker "Laughing Jeremy"


-- Union types must create new tags

type Counter = AnonCounter Int | NamedCounter { name : String, c : Int }

