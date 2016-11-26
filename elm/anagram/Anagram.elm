module Anagram exposing (..)

import String exposing (..)


detect : String -> List String -> List String
detect word list =
    case list of
        [] ->
            list

        car :: cdr ->
            if String.toUpper car == String.toUpper word then
                detect word cdr
            else if sortString car == sortString word then
                car :: detect word cdr
            else
                detect word cdr


sortString : String -> String
sortString str =
    str
        |> String.toUpper
        |> String.split ""
        |> List.sort
        |> String.join ""
