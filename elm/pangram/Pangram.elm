module Pangram exposing (..)

import String exposing (..)
import List exposing (..)
import Regex exposing (regex)


isPangram : String -> Bool
isPangram sentence =
    sentence
        |> String.toUpper
        |> String.toList
        |> List.filter dropNonAlpha
        |> List.sort
        |> List.foldl dedup []
        |> List.reverse
        |> isIdenticalWithAlphabet


dropNonAlpha : Char -> Bool
dropNonAlpha c =
    Regex.contains (regex "[A-Z]") (toString c)


dedup : Char -> List Char -> List Char
dedup letter acc =
    if List.member letter acc then
        acc
    else
        letter :: acc


isIdenticalWithAlphabet : List Char -> Bool
isIdenticalWithAlphabet list =
    List.length list == 26
