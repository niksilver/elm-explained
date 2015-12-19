module DefiningFunctions where

import String exposing (length)
import List exposing (filter, map)

-------------------------------------------------------------
-- Named functions
-------------------------------------------------------------

-- We can define a function simply by naming it.

isEvenLength: String -> Bool
isEvenLength s =
    (length s % 2 == 0)

{- Here it is in use:

   > import DefiningFunctions exposing (..)
   > isEvenLength "Hello"
   False : Bool
   > isEvenLength "Hell"
   True : Bool
   >

-}

-------------------------------------------------------------
-- Anonymous functions
-------------------------------------------------------------

{- Before the next part, here's a reminder that the filter function
   filters through just those elements of a list that pass a specific
   test - i.e. they return True from a specific function.
   
   > import DefiningFunctions exposing (..)
   > import List exposing (filter)
   > filter isEvenLength ["Once", "upon", "a", "time", "long", "ago"]
   ["Once","upon","time","long"] : List String
   >

-}

-- We can define a function anonymously using the backslash operator.
-- Here the function we pass to filter is anonymous.
-- It's usual not to have a space after the backslash, but we can.

ones: List String -> List String
ones li =
    filter (\ s -> length s == 1) li

{- Here's the ones function in use:

   > import DefiningFunctions exposing (..)
   > ones ["a", "bb", "c", "d", "ee"]
   ["a","c","d"] : List String
   >

-}

-- We can define an anonymous function and then give it a name after.

concat : String -> String -> String
concat = (\a b -> a ++ b)

{- Here it is in use:

   > import DefiningFunctions exposing (..)
   > concat "elm" "o"
   "elmo" : String
   >

-}

-------------------------------------------------------------
-- Type tags (constructors) are functions, too.
-------------------------------------------------------------

-- If we've defined a type with a tag then the tag (the constructor)
-- is a function, too.
--
-- Here we use `map` to convert a list of Int values into a list
-- of Boxed values.

type Boxed = Boxed Int

box : List Int -> List Boxed
box li =
    map Boxed li

{- Here it is in use:

   > import DefiningFunctions exposing (..)
   > box [7, 6, 5, 4]
   [Boxed 7,Boxed 6,Boxed 5,Boxed 4] : List DefiningFunctions.Boxed
   >

-}

-------------------------------------------------------------
-- Record fields define functions
-------------------------------------------------------------

{- Any record is a function if you precede it immediately
   with a "." (no whitespace). It is a function that takes
   any type of record with that field, and returns the value
   of that field. Here's what we can do on the Elm repl:

   > .name
   <function> : { b | name : a } -> a
   > .age
   <function> : { b | age : a } -> a
   > .totallyUnlikelyMadeUpField
   <function> : { b | totallyUnlikelyMadeUpField : a } -> a
   >

-}


