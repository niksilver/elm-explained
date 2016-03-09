# Type oddities

## Unused variables

In the source of Elm's core modules we can see types defined with a
variable that doesn't appear on the right hand side, like this:

```elm
type Foo a = Foo
```

Examples are in the source
for the type `Array` in
[the source of the Array module](https://github.com/elm-lang/core/blob/3.0.0/src/Array.elm#L43)
and for `Signal` in
[the source for the Signal module](https://github.com/elm-lang/core/blob/3.0.0/src/Signal.elm#L64).

However, although this is (currently) legal syntax it's only to allow
some kind of integration with the underlying native code.
We would not expect to use this ordinary Elm modules.


## Type name different from tag name

We can have the type declaration (the tag)
different from the definition, oddly.
What is the value of this?

```elm
type Laurel = Hardy Int

star1 : Laurel
star1 = Hardy 100
```

Perhaps it's a side effect of union types:

```elm
type Groucho = Chico Int | Harpo Int

star2 : Groucho
star2 = Chico 37

star3 : Groucho
star3 = Harpo 38
```
