module RecordTypes exposing (..)

-- Record types don't have names

posA : { x : Float, y : Float }
posA = { x = 2.1, y = 8.8 }


-- Naming record types

type Positioned = Positioned { x : Float, y : Float }

posB : Positioned
posB = Positioned { x = 7.7, y = 5.2 }

-- This is just like tagging an Int

type Aged = Aged Int

century = Aged 100

