# Applying functions

First, some functions that will be useful to us. (These can be found in
[the module ApplyingFunctions](ApplyingFunctions.elm).)

```elm
increment a =
  a + 1

concat4 a b c d =
  a ++ b ++ c ++ d

isEven : Float -> Bool
isEven x =
  (toFloat (round x) == x
    && modBy 2 (round x) == 0
  )
```

## "Applied to..."

The `<|` operator can be read as "applied to...".
We can read the code here as "increment applied to 17":

```elm
res1 = increment <| 17    -- res1 is 18
```

Since spaces bind tightest of all, the right hand argument of `<|` is
effectively appended at the end. So here, `res2a` is "Password123"

```elm
res2a = concat4 "Pass" "w" "ord" <| String.fromInt 123
```

This is often useful for avoiding parentheses and making the code easier
to read. The above code is equivalen to

```elm
res2b = concat4 "Pass" "w" "ord" (String.fromInt 123)
```

## "Piped into..."

The `|>` operator is also called the "pipe" operator and can be read
"piped into...".
We can read the code below as "17 piped into increment".

```elm
res3 = 17 |> increment    -- res3 is also 18
```

Again, as spaces bind tightest of all the left hand argument of `|>` is
effectively appended at the end. So `res4` is also "Password123"

```elm
res4 = String.fromInt 123 |> concat4 "Pass" "w" "ord"
```

## Composition with "composed with..."

The `<<` operator can be read "composed with...".
It composes functions right to left. Although that might not
seem useful it reads very well, as demonstrated here:

```elm
fun5 : Float -> Bool
fun5 = not << isEven << sqrt
```

Now `fun5` is a function that does `not(isEven(sqrt(...)))`.

```elm
res6 = fun5 81    -- True, because the square root of 81 is indeed not even
res7 = fun5 64    -- False, because the square root of 64 is even
```

## Composition with "and then..."

The `>>` operator can be read "and then...".
It composes functions left to right. It looks intuitive, although it
probably doesn't read so well.
This next function does the same as the one above. We can
read it as "`sqrt`, and then `isEven`, and then `not`".

```elm
fun8 : Float -> Bool
fun8 = sqrt >> isEven >> not

res9  = fun8 81    -- True, because the square root of 81 is indeed not even
res10 = fun8 64    -- False, because the square root of 64 is even
```

