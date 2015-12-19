module DefiningFunctions where

import String exposing (length)
import List exposing (filter)

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

->
