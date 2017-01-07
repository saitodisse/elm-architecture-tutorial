module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)


main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- MODEL


type alias Model =
    Int


model : Model
model =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Reset ->
            0



-- VIEW


buttonStyle =
    style
        [ ( "font-size", "100%" )
        , ( "padding", "6px 16px" )
        , ( "margin", "0 0 20px 0" )
        , ( "min-width", "67px" )
        ]


view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "display", "flex" )
            , ( "flex-direction", "column" )
            , ( "justify-content", "flex-start" )
            , ( "height", "50%" )
            , ( "align-items", "center" )
            , ( "font-size", "28px" )
            ]
        ]
        [ div
            [ style
                [ ( "font-size", "35px" )
                , ( "padding", "16px" )
                , ( "margin", "16px" )
                , ( "border", "5px solid #ccc" )
                ]
            ]
            [ text (toString model) ]
        , button [ onClick Decrement, buttonStyle ] [ text "-1" ]
        , button [ onClick Increment, buttonStyle ] [ text "+1" ]
        , if model /= 0 then
            button [ onClick Reset ] [ text "reset to zero" ]
          else
            text ""
        ]
