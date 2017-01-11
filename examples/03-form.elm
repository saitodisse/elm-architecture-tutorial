module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- MODEL


type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    }


model : Model
model =
    Model "" "" ""



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name val ->
            { model | name = val }

        Password val ->
            { model | password = val }

        PasswordAgain val ->
            { model | passwordAgain = val }



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ containerStyle
        ]
        [ div [ divStyle ]
            [ label [] [ text "Name: " ]
            , (input [ type_ "text", placeholder "Name", onInput Name ] [])
            ]
        , div [ divStyle ]
            [ label [] [ text "Password: " ]
            , (input [ type_ "password", placeholder "Password", onInput Password ] [])
            ]
        , div [ divStyle ]
            [ label [] [ text "Repeate Password: " ]
            , (input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] [])
            ]
        , viewValidation model
        ]


divStyle =
    style
        [ ( "margin", "10px 0 0 0" ) ]


containerStyle =
    style
        [ ( "display", "flex" )
        , ( "flex-direction", "column" )
        , ( "padding", "20px" )
        , ( "justify-content", "flex-start" )
        , ( "align-items", "flex-start" )
        , ( "font-size", "18px" )
        ]


checkSamePassword model =
    if model.password == model.passwordAgain then
        ( "green", "OK" )
    else
        ( "red", "Passwords do not match." )


viewValidation : Model -> Html msg
viewValidation model =
    let
        ( color, message ) =
            if (String.length model.password) > 8 then
                checkSamePassword model
            else
                ( "red", "Passwords has to have a minimum of 8 characters." )
    in
        div
            [ style [ ( "color", color ) ] ]
            [ text message ]
