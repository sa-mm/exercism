module WordCount exposing (..)

import Dict exposing (Dict)
import String exposing (..)
import Regex exposing (regex)


wordCount : String -> Dict String Int
wordCount str =
    str
        |> String.toLower
        |> String.filter dropNonAlphaNum
        |> String.split " "
        |> List.filter dropEmpty
        |> List.foldl theUpdate Dict.empty



-- Shamelessly stolen from http://exercism.io/submissions/ddd625e8fcda42a998e3c15fbbc95c8f
-- Now here: http://exercism.io/submissions/60271747dd664dc48fa6208e68a44f01


theUpdate : String -> Dict String Int -> Dict String Int
theUpdate word dict =
    Dict.update word (increment) dict



-- Dict.update word (\v -> Just (1 + (Maybe.withDefault 0) v)) dict


increment : Maybe Int -> Maybe Int
increment count =
    Just (1 + (Maybe.withDefault 0) count)


dropNonAlphaNum : Char -> Bool
dropNonAlphaNum c =
    Regex.contains (regex "[a-z0-9\\s]") (toString c)


dropEmpty : String -> Bool
dropEmpty str =
    str /= ""
