module Generics where

-- Here is a list of strings, and a list of ints.
-- Notice the type declarations of each

list1 : List String
list1 = [ "Eenie", "Meenie", "Miney", "Mo" ]

list2 : List Int
list2 = [ 10, 9, 8, 7 ]

-- When we declare a type, the left had side of the equals sign says
-- how it's used; the right hand side says how it's defined.
--
-- So the IntHolder is defined as an Int tagged with the IntHolder label
-- (the right hand side) and we use it just by saying IntHolder (the
-- left hand side).
--
-- The PairHolder is defined as an Int and an Int tagged with the
-- PairHolder label (its right hand side) and when we use it we can
-- just say PairHolder (the left hand side).
--
-- The MiscHolder can hold any type of value. It's defined as an
-- unknown type a, tagged with the MiscHolder label (its right hand side),
-- but when we use it we must use both the MiscHolder label and the
-- specific type that's in use at the time.

type IntHolder = IntHolder Int
type PairHolder = PairHolder Int Int
type MiscHolder a = MiscHolder a

-- Here's how we use them to define some values, each with its own
-- type declaration.

holderWithFour : IntHolder
holderWithFour = IntHolder 4

coordinates : PairHolder
coordinates = PairHolder 450 91

stringInABox : MiscHolder String
stringInABox = MiscHolder "Greetings, Earthlings"

floatInABox : MiscHolder Float
floatInABox = MiscHolder 45.1

-- We have to use parentheses here, otherwise the compiler will
-- report an error, because a MiscHolder has one additional type only.

listOfStringsInABox : MiscHolder (List String)
listOfStringsInABox = MiscHolder ["Once", "upon", "a", "time"]

-- Let's define a type for something that's been weighed. We need
-- to capture the thing itself, the weight as a floating point number,
-- and the weighing units (lb or kg). When we use the type in future
-- we need to specify its name, the type of thing that's been weighed,
-- and the units used. We don't have to specify that fact that we use
-- floats, because that doesn't change.

