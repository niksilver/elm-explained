# Type questions

## Oddity: Unused variables

What does it mean to define a type where the variable doesn't appear
on the right hand side?
We can see an example of this for
`Array` in
[the source of the Array module](https://github.com/elm-lang/core/blob/3.0.0/src/Array.elm#L39)
and for `Signal` in
[the source for the Signal module](https://github.com/elm-lang/core/blob/3.0.0/src/Signal.elm#L59).

```elm
type Foo a = Foo
```

Notice the different type declarations of x and y here.

```elm
x : Foo Int
x = Foo

y : Foo b
y = Foo

z = Foo
```

Here's what happens in use, if we put them in
[a module called TypeQuestions](TypeQuestions.elm).
Notice that we've defined `y` above as
type `Foo b` but the variable `b` is replaced with
arbitrary variable name `a` below.

```
> import TypeQuestions exposing (..)
> x
Foo : TypeQuestions.Foo Int
> y
Foo : TypeQuestions.Foo a
> z
Foo : TypeQuestions.Foo a
>
```

## Oddity: Type name different from tag name

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
