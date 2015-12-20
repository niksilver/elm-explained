module ApplyingFunctions where

-- First, some functions that will be useful to us

increment a =
    a + 1

concat4 a b c d =
    a ++ b ++ c ++ d

isEven : Float -> Bool
isEven x =
    (toFloat (round x) == x
        && round x % 2 == 0
    )

-------------------------------------------------------------
-- "Applied to..."
-------------------------------------------------------------

-- The <| operator can be read as "applied to...".
-- We can read the code here as "increment applied to 17"

res1 = increment <| 17    -- res1 is 18

-- Since spaces bind tightest of all, the right hand argument of <| is
-- effectively appended at the end. So res2 is "OnceUponATime"

res2 = concat4 "Once" "Upon" "A" <| "Time"

-------------------------------------------------------------
-- "Applying..."
-------------------------------------------------------------

-- The |> operator can be read as "applying...".
-- We can read the code below as "17 applying increment".

res3 = 17 |> increment    -- res3 is also 18

-- Again, as spaces bind tightest of all the left hand argument of |> is
-- effectively appended at the end. So res4 is also "OnceUponATime"

res4 = "Time" |> concat4 "Once" "Upon" "A"

-------------------------------------------------------------
-- Composition with "composed with..."
-------------------------------------------------------------

-- The << operator can be read "composed with...".
-- It composes functions right to left. Although that might not
-- seem useful it reads very well, as demonstrated here:

fun5 : Float -> Bool
fun5 = not << isEven << sqrt

-- Now fun5 is a function that does not(isEvent(sqrt(..)))

res6 = fun5 81    -- True, because the square root of 81 is indeed not even
res7 = fun5 64    -- False, because the square root of 64 is even

-------------------------------------------------------------
-- Composition with "and then..."
-------------------------------------------------------------

-- The >> operator can be read "and then...".
-- It composes functions left to right. It looks intuitive but
-- doesn't usually read so well.
-- This function does the same as the one above.

fun8 : Float -> Bool
fun8 = sqrt >> isEven >> not

res9  = fun8 81    -- True, because the square root of 81 is indeed not even
res10 = fun8 64    -- False, because the square root of 64 is even

