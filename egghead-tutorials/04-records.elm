module Main exposing (..)

import Html exposing (text)


type alias Dog =
    { name : String
    , age : Int
    }


dog =
    { name = "Spock"
    , age = 3
    }


renderDog : Dog -> String
renderDog dog =
    dog.name ++ " is " ++ (toString dog.age) ++ " years old."



-- 1) get dog name
--main =
--    text <|
--        dog.name
-- 2) .name creates a function that get its property from dog
--main =
--    text <|
--        .name dog
--main =
--    text <|
--        -- 3) to display age we have to convert number type to string
--        Basics.toString
--        <|
--            .age dog


main =
    text <|
        renderDog dog
