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

-- This next line defines a type called `Point`, and its associated
-- tag/constructor (also called `Point`). But that tag is also
-- a function from the plain record to a `Point`.
-- This is exactly the same idea as with simple type tags
-- We can see this with the `map` function.

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

{- Here's how it looks in the REPL. Notice that we've converted
from the type of `triangle1` to the type of `triangle2` thanks
to the `Point` function.
> import DefiningFunctions exposing (..)
> triangle1
[{ x = 0, y = 0 },{ x = 8, y = 1 },{ x = 5, y = 7 }]
    : List { x : Float, y : Float }
> triangle2
[Point { x = 0, y = 0 },Point { x = 8, y = 1 },Point { x = 5, y = 7 }]
    : List DefiningFunctions.Point
>
-}


-- Type aliases for records act as multi-parameter functions

-- If we have a type alias for a record then that also acts as a function,
-- but in a different way from a type declaration. Let's define
-- a type alias...

type alias Person = { name : String, age : Int }

-- Now the `Person` function is one that takes several arguments,
-- one for each field, and it will return a record with those fields.
-- This means we need to know the order in which we originally defined
-- the fields.

{- Let's look at it in the REPL.
Remember that `DefiningFunctions` is just the name of our module,
so `DefiningFunctions.Person` is just the fully qualified name of
`Person`:
> import DefiningFunctions exposing (..)
> Person
<function> : String -> Int -> DefiningFunctions.Person
>
-}

-- Here we define a value using the `Person` function:

bob : { name : String, age : Int }
bob = Person "Robert" 55

-- And here we use the `Person` function to bring a list of names
-- and a list of ages together:

people : List { name : String, age : Int }
people =
    map2 Person ["Alice", "Brian", "Coco"] [61, 23, 35]

{- Let's see what that looks like in the REPL:
> import DefiningFunctions exposing (..)
> bob
{ name = "Robert", age = 55 } : { age : Int, name : String }
> people
[{ name = "Alice", age = 61 },{ name = "Brian", age = 23 },{ name = "Coco", age = 35 }]
: List { age : Int, name : String }
>
-}

