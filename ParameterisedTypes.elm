module ParameterisedTypes where

-- Here is a list of strings, and a list of ints.
-- Notice their type declarations.

list1 : List String
list1 = [ "Eenie", "Meenie", "Miney", "Mo" ]

list2 : List Int
list2 = [ 10, 9, 8, 7 ]

-- When we declare a type, the left had side of the equals sign says
-- how it's used; the right hand side says how it's defined.
--
-- This MiscHolder can hold any type of value. It's defined as an
-- unknown type a, tagged with the MiscHolder label (its right hand side),
-- but when we use it we must use both the MiscHolder label and the
-- specific type that's in use at the time.

type MiscHolder a = MiscHolder a

-- Here's how we use it to define some values, each with its own
-- type declaration.

stringInABox : MiscHolder String
stringInABox = MiscHolder "Greetings, Earthlings"

floatInABox : MiscHolder Float
floatInABox = MiscHolder 45.1

-- Since MiscHolder has only one additional type, when we use it to
-- hold a List of Strings we have to put the "List String" in parentheses,
-- otherwise the compiler will report an error.

listOfStringsInABox : MiscHolder (List String)
listOfStringsInABox = MiscHolder ["Once", "upon", "a", "time"]

-- Let's define a type for something that's been weighed. We need
-- to capture the thing itself, the weight as a floating point number,
-- and the weighing units (lb or kg). When we use it in a type declaration
-- in future we need to specify its name and the type of thing that's been
-- weighed.

-- First, some type definitions to get us started. The Unit type defines
-- two values, Lb and Kg. See the Enumerations file for more on that.

type Car = Car String
type AnimalPart = AnimalPart String
type Unit = Lb | Kg

-- Now the main type definition, and how we use it.

type Weighed a = Weighed a Float Unit

volvo = Car "Volvo"
feather = AnimalPart "Ostrich feather"

volvoWeighed : Weighed Car
volvoWeighed = Weighed volvo 2260 Kg

featherWeighed : Weighed AnimalPart
featherWeighed = Weighed feather 0.001 Lb

