# Extensible record types

## Defining extensible records

We can define a record type that has *at least* the given fields.
Here we define aliases for two record types.
Type `JustXY` has just the fields `x` and `y`. It is an ordinary record type.
Type `IncXY` has at least the fields `x` and `y`.
It is an extensible record type.

```elm
type alias JustXY  =     { x : Float, y : Float }

type alias IncXY a = { a | x : Float, y : Float }
```

Notice that the `IncXY` type has to declare the use of type variable `a`.
That's because the type definition effectively reads "something of type
`a` which also has a field `x` which is a Float and a field `y` which is a
Float". See
[our notes on parameterised types](ParameterisedTypes.md)
elsewhere.

Here we define a value of type `JustXY` and one of type `IncXY`.

```elm
jxy : JustXY
jxy = { x = 1.1, y = 2.1 }

ixy : IncXY { z : Float }
ixy = { x = 10.1, y = 11.1, z = 12.1 }
```

Notice the very different type declaration of `ixy`.
This is because `IncXY` was declared with a variable type (`IncXY a`).
Now that we're actually using it we must state what that variable type
is (i.e. what the `a` is) in this particular case. And in this case
it's the `z` part of the record.

Now we define two functions which take a `JustXY` and an `IncXY`.
The `sumInc` function will accept values of both types,
but the `sumJust` function will only take a value of `JustXY`.

```elm
sumJust : JustXY -> Float
sumJust coords =
    coords.x + coords.y

sumInc : IncXY a -> Float
sumInc coords =
    coords.x + coords.y
```

Here's how we can (and can't) use them:

```elm
res1 = sumJust jxy
-- This next line won't compile if we uncomment it
-- res2 = sumJust ixy
res3 = sumInc ixy
res4 = sumInc jxy
```

If we put all the code above into
[an Elm module called ExtensibleRecordTypes](ExtensibleRecordTypes.elm)
then this is what it looks like in the Elm REPL:

```
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

If we uncomment the `res2` line above and try to import the module
we'll get a compilation error.
