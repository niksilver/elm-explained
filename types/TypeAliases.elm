module TypeAliases exposing (..)

type alias Ship = { name : String }
type alias Person = { name : String }

vessel : Ship
vessel = { name = "HMS Splendid" }

captain : Person
captain = { name = "Captain Robert Q. Peabody" }

launch : Ship -> String
launch s =
  "I name this ship " ++ s.name

greet : Person -> String
greet p =
  "Hello there, " ++ p.name

launchShip = launch vessel
greetPerson = greet captain

launchPerson = launch captain
greetShip = greet vessel

