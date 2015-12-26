# Type constructors

A type constructor defines a new type, and gives us protection
against misuse.

In this example we'll define a Ship and a Person, which both have
a name, but we won't be able to substitute one for the other
in a function which requires a specific one.

```elm
type Ship = Ship String
type Person = Person String
```

The symbols Ship and Person are also called tags - they are tagging
the String to indentify intended use.

Next we'll create a specific Ship and Person.
They will therefore be of distinct types:

```elm
vessel : Ship
vessel = Ship "HMS Splendid"

captain : Person
captain = Person "Captain Robert Q. Peabody"
```

Here are two functions which take a Ship and a Person as arguments.
To extract the data embedded in the type we use pattern matching.

```elm
launch : Ship -> String
launch s
    = case s of
        Ship name -> "I name this ship " ++ name

greet : Person -> String
greet p
    = case p of
        Person name -> "Hello there, " ++ name
```

Here we launch a ship and greet a person. As you'd expect, both
functions compile fine and give the expected output.

```elm
launchShip = launch vessel
greetPerson = greet captain
```

If we put all the code above into
[an Elm module called TypeConstructors.elm](TypeConstructors.elm)
then We can execute it in the Elm REPL to check

```
> import TypeConstructors exposing (..)
> launchShip
"I name this ship HMS Splendid" : String
> greetPerson
"Hello there, Captain Robert Q. Peabody" : String
>
```

But these next two functions won't compile.

```elm
launchPerson = launch captain
greetShip = greet vessel
```

Here's what it looks like in the REPL if we try to add it into
our module and then import that module:

```
> import TypeConstructors exposing (..)
-- TYPE MISMATCH --------------------------------- .\.\TypeConstructors.elm

The argument to function `launch` is causing a mismatch.

57|                launch captain
                          ^^^^^^^
Function `launch` is expecting the argument to be:

    Ship

But it is:

    Person

>
```

We can of course also define a type with more than one argument.
Here is how we define and use a number with a name

```elm
type NamedInt = NamedInt String Int

describe : NamedInt -> String
describe ni
  = case ni of
      NamedInt name num -> "Number " ++ name ++ " looks like " ++ (toString num)

n1 = NamedInt "one" 1
n2 = NamedInt "two" 2
n37 = NamedInt "thirty seven" 37
```

If we add that code to our module
we can used that like this in the Elm REPL:

```
> import TypeConstructors exposing (..)
> describe n37
"Number thirty seven looks like 37" : String
>
```

