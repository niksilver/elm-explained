module ApplyingFunctions where

increment a =
    a + 1

concat4 a b c d =
    a ++ b ++ c ++ d

isEven : Float -> Bool
isEven x =
    (toFloat (round x) == x
        && round x % 2 == 0
    )


-- "Applied to..." using `<|`

res1 = increment <| 17    -- res1 is 18

res2 = concat4 "Once" "Upon" "A" <| "Time"


-- "Applying..." using `|>`

res3 = 17 |> increment    -- res3 is also 18

res4 = "Time" |> concat4 "Once" "Upon" "A"


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

