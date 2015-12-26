module DefiningFunctions where

import String exposing (length)
import List exposing (filter, map, map2)


-- Named functions

isEvenLength: String -> Bool
isEvenLength s =
    (length s % 2 == 0)


-- Anonymous functions

ones: List String -> List String
ones li =
    filter (\s -> length s == 1) li

concat : String -> String -> String
concat = (\a b -> a ++ b)


-- Simple type tags (constructors) are functions, too

type Boxed = Boxed Int

box : List Int -> List Boxed
box li =
    map Boxed li


-- Type tags for records are also functions

type Point = Point { x : Float, y : Float }

triangle1 : List { x : Float, y : Float }
triangle1 =
    [ { x = 0, y = 0 }
    , { x = 8, y = 1 }
    , { x = 5, y = 7 }
    ]

triangle2 : List Point
triangle2 =
    map Point triangle1


-- Type aliases for records act as multi-parameter functions

type alias Person = { name : String, age : Int }

bob : { name : String, age : Int }
bob = Person "Robert" 55

people : List { name : String, age : Int }
people =
    map2 Person ["Alice", "Brian", "Coco"] [61, 23, 35]

