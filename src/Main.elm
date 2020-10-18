module Main exposing (main)

import Browser
import Html exposing (Html)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)



-- MAIN


main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }



-- MODEL


type alias Model = 
  { content : String
  }
 


init : () -> (Model, Cmd Msg)
init _ =
  ( Model ""
  , Cmd.none
  )



-- UPDATE


type Msg
  = Click String



update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Click url ->
      ( model
      , Cmd.none
      )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW


view : Model -> Html Msg
view model = 
  layout [] <|
    column [ height fill, width fill ]
      [ header
      , content
      , footer
      ]   

footer: Element Msg
footer = 
  el 
    [centerX]
    (text "©2020 www.qinmishu.org ")

content: Element Msg        
content = row
  [ width fill, height fill 
  , paddingXY 20 5
  , Border.widthEach { bottom = 1, top = 0, left = 0, right = 0 }
  , Border.color <| rgb255 200 200 200
  ]
  [
    text "coming soon... \ncontact me: hongxinx (at) gmail.com "
  ]
header: Element Msg
header = row 
  [ width fill
  , paddingXY 20 5
  , Border.widthEach { bottom = 1, top = 0, left = 0, right = 0 }
  , Border.color <| rgb255 200 200 200
  ]
  [ mainTitle
  , clickButton "Index"
  , clickButton "About"
  , clickButton "Project"]      

mainTitle: Element Msg
mainTitle = 
  el 
    [ padding 5
    , Border.width 1
    , Border.rounded 3
    , Border.color <| rgb255 200 200 200
    ]
    (text "www.qinmishu.org")
    
clickButton: String->Element Msg  
clickButton caption = 
  Input.button
    [ padding 5
    , alignRight
    , Border.width 1
    , Border.rounded 3
    , Border.color <| rgb255 200 200 200
    ]
    { onPress = Nothing
    , label = text caption
    }