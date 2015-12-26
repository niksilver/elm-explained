module TypeQuestions where

-- Oddity: Unused variables

type Foo a = Foo

x : Foo Int
x = Foo

y : Foo b
y = Foo

z = Foo


-- Oddity: Type name different from tag name

type Laurel = Hardy Int

star1 : Laurel
star1 = Hardy 100

type Groucho = Chico Int | Harpo Int

star2 : Groucho
star2 = Chico 37

star3 : Groucho
star3 = Harpo 38

