module Main exposing (..)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String


main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- MODEL


type alias Model =
    String


model : Model
model =
    ""



-- UPDATE


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            newContent



-- VIEW


view : Model -> Html Msg
view model =
    div [ containerStyle ]
        [ input
            [ inputStyle
            , placeholder "Text to reverse"
            , onInput
                (Debug.log
                    "[2] (update - onInput)"
                    Change
                )
            ]
            []
        , div []
            [ text
                (String.toLower
                    (String.reverse
                        (Debug.log "[3] (VIEW - model.content)"
                            model
                        )
                    )
                )
            ]
        ]


containerStyle =
    style
        [ ( "display", "flex" )
        , ( "flex-direction", "column" )
        , ( "justify-content", "flex-start" )
        , ( "height", "50%" )
        , ( "align-items", "center" )
        , ( "font-size", "28px" )
        ]


inputStyle =
    style
        [ ( "width", "100%" )
        , ( "font-size", "28px" )
        , ( "text-align", "center" )
        ]
