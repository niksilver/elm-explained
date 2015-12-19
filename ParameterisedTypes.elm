module ParameterisedTypes where

-------------------------------------------------------------
-- Lists are parameterised types
-------------------------------------------------------------

-- Here is a list of strings, and a list of ints.
-- Notice their type declarations.

list1 : List String
list1 = [ "Eenie", "Meenie", "Miney", "Mo" ]

list2 : List Int
list2 = [ 10, 9, 8, 7 ]

-------------------------------------------------------------
-- A simple example
-------------------------------------------------------------

-- When we declare a type, the left had side of the equals sign says
-- how it's used; the right hand side says how it's defined.
--
-- This MiscHolder can hold any type of value. It's defined as an
-- unknown type a, tagged with the MiscHolder label (its right hand side),
-- but when we use it we must use both the MiscHolder tag and the
-- specific type that's in use at the time.

type MiscHolder a = MiscHolder a

-- Here's how we use it to define some values, each with its own
-- type declaration.

stringInABox : MiscHolder String
stringInABox = MiscHolder "Greetings, Earthlings"

floatInABox : MiscHolder Float
floatInABox = MiscHolder 45.1

-------------------------------------------------------------
-- When to use parentheses
-------------------------------------------------------------

-- Since MiscHolder has only one additional type, when we use it to
-- hold a List of Strings we have to put the "List String" in parentheses,
-- otherwise the compiler will report an error.

listOfStringsInABox : MiscHolder (List String)
listOfStringsInABox = MiscHolder ["Once", "upon", "a", "time"]

-------------------------------------------------------------
-- A more involved example
-------------------------------------------------------------

-- Let's define a type for something that's been weighed. We need
-- to capture the thing itself, the weight as a floating point number,
-- and the weighing units (expressed as a String). When we use Weighed
-- in a type declaration in future we need to use its name and
-- the type of thing that's been weighed.

-- First, some type definitions to get us started.

type Car = Car String
type AnimalPart = AnimalPart String

-- Now the main type definition.

type Weighed a = Weighed a Float String

-- Notice that the unspecified thing being weighed (unspecified type a)
-- has to have its type exposed on the left hand side of the equals
-- sign. Then when we declare the type of a Weighed thing we need to
-- specify the thing's type, too (a Car or an AnimalPart).

-- Now let's see some simple use...

volvo = Car "Volvo"
feather = AnimalPart "Ostrich feather"

volvoWeighed : Weighed Car
volvoWeighed = Weighed volvo 2260 "kg"

featherWeighed : Weighed AnimalPart
featherWeighed = Weighed feather 8.5 "g"

-- We can do it without the interim values, too. But in this case
-- have to use parentheses...

volvoWeighed2 : Weighed Car
volvoWeighed2 = Weighed (Car "Volvo") 2260 "kg"

featherWeighed2 : Weighed AnimalPart
featherWeighed2 = Weighed (AnimalPart "Ostrich feather") 8.5 "g"

{- Here's how we might explore this with the Elm REPL:

   > import ParameterisedTypes exposing (..)
   > volvoWeighed
   Weighed (Car "Volvo") 2260 "kg"
       : ParameterisedTypes.Weighed ParameterisedTypes.Car
   > volvoWeighed == volvoWeighed2
   True : Bool
   > featherWeighed == featherWeighed2
   True : Bool
   >

-}
