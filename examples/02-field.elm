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
    { content : String
    , pickCount : Int
    }


model : Model
model =
    Model "Abcdef 123456" 3



-- UPDATE


type Msg
    = Change String
    | NumberCharsChanged String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model
                | content =
                    (Debug.log "[1] (UPDATE - newContent)"
                        newContent
                    )
            }

        NumberCharsChanged newPickCounter ->
            { model
                | pickCount =
                    case String.toInt newPickCounter of
                        Err msg ->
                            0

                        Ok val ->
                            val
            }



-- VIEW


view : Model -> Html Msg
view model =
    div [ containerStyle ]
        [ input
            [ inputStyle
            , placeholder "Text to reverse"
            , value model.content
            , onInput
                (Debug.log
                    "[2.1] (update - onInput)"
                    Change
                )
            ]
            []
        , input
            [ inputStyle
            , value (toString model.pickCount)
            , onInput
                (Debug.log
                    "[2.2] (update - onInput)"
                    NumberCharsChanged
                )
            ]
            []
        , div []
            [ text
                ("Reversed: "
                    ++ (String.toLower
                            (String.reverse
                                (Debug.log "[3] (VIEW - model.content)"
                                    model.content
                                )
                            )
                       )
                )
            ]
        , div [ divContainerRowStyle ]
            [ div []
                [ text
                    (String.left
                        model.pickCount
                        model.content
                    )
                ]
            , div []
                [ text
                    "..."
                ]
            , div []
                [ text
                    (String.right
                        model.pickCount
                        model.content
                    )
                ]
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


divContainerRowStyle =
    style
        [ ( "display", "flex" )
        , ( "flex-direction", "row" )
        ]


inputStyle =
    style
        [ ( "width", "100%" )
        , ( "font-size", "28px" )
        , ( "text-align", "center" )
        ]
