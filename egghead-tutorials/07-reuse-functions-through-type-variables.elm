module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Person =
    { name : String
    , age : Int
    }


people =
    [ { name = "Julio", age = 35 }
    , { name = "Karen", age = 47 }
    ]


numbers =
    [ 1, 2, 3, 4, 5 ]



-- We know it can take in any type because it's got a lower case word instead
-- of an upper case word as its type, and we've been able to call it with
-- both a list of integers and a list of objects.


renderAnything things =
    ul [] (List.map renderThing things)


renderThing thing =
    li []
        [ text <| toString thing
        ]


main =
    div []
        [ h1 [] [ text "numbers:" ]
        , ul []
            [ li [] [ renderAnything numbers ]
            ]
        , h1 [] [ text "people:" ]
        , ul []
            [ li [] [ renderAnything people ]
            ]
        ]
