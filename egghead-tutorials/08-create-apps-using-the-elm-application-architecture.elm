module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


model =
    { showFace = False
    }


type Msg
    = ShowFace
    | HideFace


update msg model_ =
    case msg of
        ShowFace ->
            { model_
                | showFace = True
            }

        HideFace ->
            { model_
                | showFace = False
            }


view model_ =
    div
        [ style
            [ ( "display", "flex" )
            , ( "flex-direction", "column" )
            , ( "justify-content", "center" )
            , ( "align-items", "center" )
            ]
        ]
        [ h1 [] [ text "Face generator" ]
        , div
            [ style
                [ ( "display", "flex" )
                , ( "flex-direction", "row" )
                , ( "justify-content", "center" )
                , ( "align-items", "center" )
                ]
            ]
            [ button
                [ onClick ShowFace
                ]
                [ text "Show" ]
            , button
                [ onClick HideFace
                , style
                    [ ( "margin-left", "10px" )
                    ]
                ]
                [ text "Hide" ]
            ]
        , if model_.showFace then
            p [] [ text "( ͡° ͜ʖ ͡°)" ]
          else
            text ""
        ]


main =
    Html.beginnerProgram
        { model = model
        , update = update
        , view = view
        }
