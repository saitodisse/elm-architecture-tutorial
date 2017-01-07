module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String.Extra exposing (pluralize)


type alias Person =
    { name : String
    , age : Int
    }


people =
    [ { name = "Julio", age = 35 }
    , { name = "Karen", age = 47 }
    , { name = "Mario", age = 39 }
    , { name = "Gullit", age = 25 }
    ]


renderPeople peeps =
    ul [] (List.map renderPerson peeps)


renderPerson thing =
    li []
        [ text <| toString thing
        ]


main =
    div []
        [ h1 [] [ text (pluralize "person" "people" (List.length people)) ]
        , renderPeople people
        ]
