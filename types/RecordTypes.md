# Record types

## Record types don't have names by default

The type of a record is just the description of its fields.
This next code
says the type of `posA` is a record with a field `x` that's a Float
and a field `y` that's a Float.

```elm
posA : { x : Float, y : Float }
posA = { x = 2.1, y = 8.8 }
```

The type of `posA` does not have a name, though.


## Naming record types

We can name a record type by tagging it - like this:

```elm
type Positioned = Positioned { x : Float, y : Float }

posB : Positioned
posB = Positioned { x = 7.7, y = 5.2 }
```

However, this isn't anything new. This is just tagging a record type
in the same way we might tag an Int type, like this:

```elm
type Aged = Aged Int

century = Aged 100
```

By the way, `posA` and `posB` do not have the same type.
`posA` is of type `{ x : Float, y : Float }`
while
`posB` is of type `Positioned`.
