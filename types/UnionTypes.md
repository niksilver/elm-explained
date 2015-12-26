# Union types

## Enumerations

A simple union type allows us to define an enumeration, like this

```elm
type Direction = North | East | South | West
```

In the above example we've defined the type `Direction`, but we've also
created and defined the values `North`, `East`, `South` and `West`.
If we put this code into
[UnionTypes.elm](UnionTypes.elm)
then we can use them like this in the REPL:

```
> import UnionTypes exposing (..)
> East
East : UnionTypes.Direction
>
```

You can see that `East` is a value, and it has type `Direction`.

Here's an example of using this

```elm
describe : Direction -> String
describe dir
    = case dir of
        North -> "Cold"
        East -> "Arid"
        South -> "Hot"
        West -> "Humid"
```

Note that the code above won't compile if we miss out one of the directions,
because the compiler expects an exhaustive match.


## More elaborate union types

Union types also allow us to use more complex constructors.
The `Character` type defined next is a simple enumeration, but
the `Card` type is a mix of tagged `Value` and tagged `String` types.

```elm
type Character = Ace | King | Queen | Jack
type Value = Pips Int | Name Character
type Card = Heart Value
    | Diamond Value
    | Club Value
    | Spade Value
    | Joker String

d10 = Diamond (Pips 10)
hking = Heart (Name King)
joker1 = Joker "Laughing Jeremy"
```

Let's look at the values' types:

```
> import UnionTypes exposing (..)
> d10
Diamond (Pips 10) : UnionTypes.Card
> hking
Heart (Name King) : UnionTypes.Card
> joker1
Joker ("Laughing Jeremy") : UnionTypes.Card
>
```

## Union types must create new tags

For a union type to be valid, all the types in the union
must be creating a new type. So we can't do (say)

```elm
type Counter = Int | { name : String, c : Int}
```

But we can do this if `AnonCounter` and `NamedCounter` are entirely
new and haven't been defined already

```elm
type Counter = AnonCounter Int | NamedCounter { name : String, c : Int }
```

See also
[Evan Czaplicki's discussion of union types](https://gist.github.com/evancz/06fe634245a3aab4a61b)

