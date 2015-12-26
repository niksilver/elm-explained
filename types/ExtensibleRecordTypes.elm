module ExtensibleRecordTypes where

-- Defining extensible records

type alias JustXY  =     { x : Float, y : Float }

type alias IncXY a = { a | x : Float, y : Float }


-- Defining values with extensible record types

jxy : JustXY
jxy = { x = 1.1, y = 2.1 }

ixy : IncXY { z : Float }
ixy = { x = 10.1, y = 11.1, z = 12.1 }

sumJust : JustXY -> Float
sumJust coords =
    coords.x + coords.y

sumInc : IncXY a -> Float
sumInc coords =
    coords.x + coords.y

res1 = sumJust jxy
-- This next line won't compile. Uncomment it and try for yourself.
-- res2 = sumJust ixy
res3 = sumInc ixy
res4 = sumInc jxy

