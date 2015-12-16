module TypeQuestions where

-- What does it mean to define a type where the variable doesn't appear
-- on the right hand side?
-- We can see example of this for
-- Array in https://github.com/elm-lang/core/blob/3.0.0/src/Array.elm
-- and Signal in https://github.com/elm-lang/core/blob/3.0.0/src/Signal.elm

type Foo a = Foo

-- Notice the different type declarations of x and y here.

x : Foo Int
x = Foo

y : Foo b
y = Foo

z = Foo

{- Here's what happens in use. Notice that we've defined y above as
   type "Foo b" but the variable b is replaced with a below.

   > import TypeQuestions exposing (..)
   > x
   Foo : TypeQuestions.Foo Int
   > y
   Foo : TypeQuestions.Foo a
   > z
   Foo : TypeQuestions.Foo a
   >

-}
