module TypeConstructors exposing (..)

type Ship = Ship String
type Person = Person String

vessel : Ship
vessel = Ship "HMS Splendid"

captain : Person
captain = Person "Captain Robert Q. Peabody"

launch : Ship -> String
launch s =
  case s of
    Ship name -> "I name this ship " ++ name

greet : Person -> String
greet p =
  case p of
    Person name -> "Hello there, " ++ name

launchShip = launch vessel
greetPerson = greet captain

-- These next two functions won't compile.
-- If we uncomment them and try to import this module we'll get
-- a type error.

-- launchPerson = launch captain
-- greetShip = greet vessel


-- Using a type with more than one argument...

type NamedInt = NamedInt String Int

describe : NamedInt -> String
describe ni =
  case ni of
    NamedInt name num -> "Number " ++ name ++ " looks like " ++ (String.fromInt num)

n1 = NamedInt "one" 1
n2 = NamedInt "two" 2
n37 = NamedInt "thirty seven" 37

