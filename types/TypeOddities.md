# Type oddities

## Type name different from tag name

We can have the type declaration (the tag)
different from the constructor, oddly.
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

However, it does allow us to write the following as legal syntax,
even though it a bad idea to write like that in practice.
It emphasises something we have said before but [will discuss
further later](https://github.com/niksilver/elm-explained/blob/master/functions/DefiningFunctions.md#simple-type-tags-constructors-are-functions-too):

```elm
type TypeName = ConstructorName Int
```

We can see how it work in the Elm REPL:

```
> type TypeName = ConstructorName Int
> ConstructorName 37
ConstructorName 37 : TypeName
>
```

The above code is in [TypeOddities.elm](TypeOddities.elm).
