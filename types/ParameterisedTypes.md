# Parameterised types

## Lists are parameterised types

Here is a list of strings, and a list of ints.
Notice their type declarations.

```elm
list1 : List String
list1 = [ "Eenie", "Meenie", "Miney", "Mo" ]

list2 : List Int
list2 = [ 10, 9, 8, 7 ]
```

## A simple example

When we declare a type, the left hand side of the equals sign says
how it's used; the right hand side says how it's defined.

The following `MiscHolder` can hold any type of value. It's defined as an
unknown type `a` tagged with the `MiscHolder` tag (its right hand side),
but when we use it we must use both the `MiscHolder` tag and the
specific type that's in use at the time.

```elm
type MiscHolder a = MiscHolder a
```

Here's how we use it to define some values, each with its own
type declaration.

```elm
stringInABox : MiscHolder String
stringInABox = MiscHolder "Greetings, Earthlings"

floatInABox : MiscHolder Float
floatInABox = MiscHolder 45.1
```

## When to use parentheses

Since `MiscHolder` has only one additional type, when we use it to
hold a List of Strings we have to put the `List String` in parentheses,
otherwise the compiler will report an error.

```elm
listOfStringsInABox : MiscHolder (List String)
listOfStringsInABox = MiscHolder ["Once", "upon", "a", "time"]
```

## A more involved example

Let's define a type for something that's been weighed. We need
to capture the thing itself, the weight as a floating point number,
and the weighing units (expressed as a String). When we use `Weighed`
in a type declaration in future we need to use its name and
the type of thing that's been weighed.

First, some type definitions to get us started.

```elm
type Car = Car String
type AnimalPart = AnimalPart String
```

Now the main type definition.

```elm
type Weighed a = Weighed a Float String
```

Notice that the thing being weighed (which has unspecified type `a`)
has to have its type exposed on the left hand side of the equals
sign. Then when we declare the type of a `Weighed` thing we need to
specify the thing's type, too (a `Car` or an `AnimalPart`).

Now let's see some simple use...

```elm
volvo = Car "Volvo"
feather = AnimalPart "Ostrich feather"

volvoWeighed : Weighed Car
volvoWeighed = Weighed volvo 2260 "kg"

featherWeighed : Weighed AnimalPart
featherWeighed = Weighed feather 8.5 "g"
```

We can do it without the interim values, too, but if so we
have to use parentheses...

```elm
volvoWeighed2 : Weighed Car
volvoWeighed2 = Weighed (Car "Volvo") 2260 "kg"

featherWeighed2 : Weighed AnimalPart
featherWeighed2 = Weighed (AnimalPart "Ostrich feather") 8.5 "g"
```

If we were to put the code above into
[an Elm module called ParameterisedTypes](ParameterisedTypes.elm)
then here's how we might explore it in the Elm REPL:

```
> import ParameterisedTypes exposing (..)
> volvoWeighed
Weighed (Car "Volvo") 2260 "kg"
    : Weighed Car
> volvoWeighed = volvoWeighed2
Weighed (Car "Volvo") 2260 "kg"
    : Weighed Car
>
>
> import ParameterisedTypes exposing (..)
> volvoWeighed
Weighed (Car "Volvo") 2260 "kg"
    : Weighed Car
> volvoWeighed == volvoWeighed2
True : Bool
> featherWeighed == featherWeighed2
True : Bool
>
```
