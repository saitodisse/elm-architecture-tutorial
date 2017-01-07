module Main exposing (..)

import Html exposing (text)


politely : String -> String
politely phrase =
    -- param type -> return type
    "Excuse me, " ++ phrase


ask : String -> String -> String
ask thing place =
    -- param type -> param type -> return type
    "is there a " ++ thing ++ " in your " ++ place ++ "?"


askPolitelyAboutFish : String -> String
askPolitelyAboutFish =
    -- point free style
    --"<<" for function composition
    -- askPolitelyAboutFish will require "place" param from ask function
    politely << (ask "fish")


main =
    text <|
        -- <| pipe operator
        askPolitelyAboutFish "house"
