# Defining functions

## Named functions

We can define a function simply by naming it:

```elm
isEvenLength: String -> Bool
isEvenLength s =
  modBy 2 (length s) == 0
```

Here it is in use, assuming we put the code in
[a module called DefiningFunctions](DefiningFunctions.elm) and import
the length function:

```
> import DefiningFunctions exposing (..)
> isEvenLength "Hello"
False : Bool
> isEvenLength "Hell"
True : Bool
>
```

## Anonymous functions

Before the next part, here's a reminder that the `filter` function
filters through just those elements of a list that pass a specific
test - i.e. those that return True from a specific function.

```
> import DefiningFunctions exposing (..)
> import List exposing (filter)
> filter isEvenLength ["Once", "upon", "a", "time", "long", "ago"]
["Once","upon","time","long"] : List String
>
```

We can define a function anonymously using the backslash operator.
Here the function we pass to `filter` is anonymous.
It's usual not to have a space after the backslash, but we can.

```elm
ones: List String -> List String
ones li =
  filter (\s -> length s == 1) li
```

Here's the `ones` function in use:

```
> import DefiningFunctions exposing (..)
> ones ["a", "bb", "c", "d", "ee"]
["a","c","d"] : List String
>
```

We can define an anonymous function and then give it a name after.

```elm
concat : String -> String -> String
concat = (\a b -> a ++ b)
```

Here it is in use:

```
> import DefiningFunctions exposing (..)
> concat "elm" "o"
"elmo" : String
>
```

## Simple type tags (constructors) are functions, too

If we've defined a type with a tag then the tag (the constructor)
is a function, too.

Here we use `map` to convert a list of Int values into a list
of `Boxed` values.

```elm
type Boxed = Boxed Int

box : List Int -> List Boxed
box li =
    map Boxed li
```

Here it is in use.

```
import DefiningFunctions exposing (..)
> box [7, 6, 5, 4]
[Boxed 7,Boxed 6,Boxed 5,Boxed 4]
    : List Boxed
>
```

## Type tags for records are also functions

Next we define a type for a record called `Point`, and its associated
tag/constructor (also called `Point`). But that tag is also
a function from the plain record to a `Point`.
This is exactly the same idea as with simple type tags.
We can see this when we use it with the `map` function.

```elm
type Point = Point { x : Float, y : Float }

triangle1 : List { x : Float, y : Float }
triangle1 =
  [ { x = 0, y = 0 }
  , { x = 8, y = 1 }
  , { x = 5, y = 7 }
  ]

triangle2 : List Point
triangle2 =
  map Point triangle1
```

Here's how it looks in the REPL. Notice that we've converted
from the type of `triangle1` to the type of `triangle2` thanks
to the `Point` function.

```
> import DefiningFunctions exposing (..)
> triangle1
[{ x = 0, y = 0 },{ x = 8, y = 1 },{ x = 5, y = 7 }]
    : List { x : Float, y : Float }
> triangle2
[Point { x = 0, y = 0 },Point { x = 8, y = 1 },Point { x = 5, y = 7 }]
    : List Point
>
```

## Type aliases for records act as multi-parameter functions

If we have a type alias for a record then that also acts as a function,
but in a different way from a type declaration. Let's define
a type alias...

```elm
type alias Person = { name : String, age : Int }
```

This gives us a `Person` function that takes several arguments,
one for each field, and it will return a record with those fields.
This means we need to know the order in which we originally defined
the fields.

If we look at it in the REPL we see that `Person` is indeed a function:

```
> import DefiningFunctions exposing (..)
> Person
<function> : String -> Int -> Person
>
```

Now let's define a value using the `Person` function, passing in two
arguments:

```elm
bob : { name : String, age : Int }
bob = Person "Robert" 55
```

And here we use the `Person` function to bring a list of names
and a list of ages together:

```elm
people : List { name : String, age : Int }
people =
  map2 Person ["Alice", "Brian", "Coco"] [61, 23, 35]
```

Let's see what that looks like in the REPL:

```
> import DefiningFunctions exposing (..)
> bob
{ age = 55, name = "Robert" }
    : { age : Int, name : String }
> people
[{ age = 61, name = "Alice" },{ age = 23, name = "Brian" },{ age = 35, name = "Coco" }]
    : List { age : Int, name : String }
>
```

## Record field names define functions

Any field name is a function if you precede it immediately
with a dot (no whitespace). It is a function that takes
any type of record with that field, and returns the value
of that field. Here's what we can do in the Elm REPL:

```
> .name
<function> : { b | name : a } -> a
> .age
<function> : { b | age : a } -> a
> .totallyUnlikelyMadeUpField
<function> : { b | totallyUnlikelyMadeUpField : a } -> a
>
```

