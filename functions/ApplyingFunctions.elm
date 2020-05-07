module ApplyingFunctions exposing (..)

increment a =
  a + 1

concat4 a b c d =
  a ++ b ++ c ++ d

isEven : Float -> Bool
isEven x =
  (toFloat (round x) == x
    && modBy 2 (round x) == 0
  )


-- "Applied to..."

res1 = increment <| 17    -- res1 is 18

res2a = concat4 "Pass" "w" "ord" <| String.fromInt 123

res2b = concat4 "Pass" "w" "ord" (String.fromInt 123)


-- "Applying..."

res3 = 17 |> increment    -- res3 is also 18

res4 = String.fromInt 123 |> concat4 "Pass" "w" "ord"


-- Composition with "composed with..."

fun5 : Float -> Bool
fun5 = not << isEven << sqrt

res6 = fun5 81    -- True, because the square root of 81 is indeed not even
res7 = fun5 64    -- False, because the square root of 64 is even


-- Composition with "and then..."

fun8 : Float -> Bool
fun8 = sqrt >> isEven >> not

res9  = fun8 81    -- True, because the square root of 81 is indeed not even
res10 = fun8 64    -- False, because the square root of 64 is even

