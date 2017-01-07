module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import List


type alias Person =
    { name : String
    , age : Int
    }


people =
    [ { name = "Julio", age = 35 }
    , { name = "Karen", age = 47 }
    ]


renderPeople peeps =
    div
        [ style
            [ ( "font-size", "18px" )
            , ( "padding", "1em" )
            ]
        ]
        [ h1 [] [ text "Lovely People" ]
        , ul [] (List.map renderPerson peeps)
        ]


renderPerson person =
    li []
        [ text person.name
        , text " is "
        , text <| toString person.age
        , text " years old."
        ]


main =
    renderPeople people
