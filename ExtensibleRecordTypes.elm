module ExtensibleRecordTypes where

-------------------------------------------------------------
-- Defining extensible records
-------------------------------------------------------------

-- We can define a record type that has *at least* the given fields.
-- Here we define aliases for two record types.
-- Type JustXY has just the fields x and y. It is an ordinary record type.
-- Type IncXY has at least the fields x and y. It is an extensible record type.

type alias JustXY  =     { x : Float, y : Float }

type alias IncXY a = { a | x : Float, y : Float }

-- Notice that the IncXY type has to declare the use of type variable a.
-- That's because the type definition effectively reads "something of type
-- a which also has a field x which is a Float and a field y which is a
-- Float". See our notes on parameterised types elsewhere.

-- Here we define a value for JustXY and one for IncXY.

jxy : JustXY
jxy = { x = 1.1, y = 2.1 }

ixy : IncXY { z : Float }
ixy = { x = 10.1, y = 11.1, z = 12.1 }

-- Notice the very different type declaration of ixy.
-- This is because IncXY was declared with a variable type ("IncXY a").
-- Now that we're actually using it we must state what that variable type
-- is (i.e. what the `a` is) in this particular case. And in this case
-- it's the z part of the record.

-- Now we define two functions which take a JustXY and an IncXY.
-- The sumInC function will accept both values,
-- but the sumJust function will only take the JustXY value.

sumJust : JustXY -> Float
sumJust coords =
    coords.x + coords.y

sumInc : IncXY a -> Float
sumInc coords =
    coords.x + coords.y

-- Here's how we can (and can't) use them:

res1 = sumJust jxy
-- This next line won't compile. Uncomment it and try for yourself.
-- res2 = sumJust ixy
res3 = sumInc ixy
res4 = sumInc jxy

{- This is what it looks like in the Elm REPL:

   > import ExtensibleRecordTypes exposing (..)
   > ixy
   { x = 10.1, y = 11.1, z = 12.1 } : ExtensibleRecordTypes.IncXY { z : Float }
   > jxy
   { x = 1.1, y = 2.1 } : ExtensibleRecordTypes.JustXY
   > res1
   3.2 : Float
   > res3
   21.2 : Float
   > res4
   3.2 : Float
   >

   If we uncomment the res2 line and try to import the module
   we'll get a compilation error.
-}
