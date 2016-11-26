module RunLengthEncoding exposing (..)

import String exposing (..)
import Char exposing (isDigit)


version : Int
version =
    2


encode : String -> String
encode str =
    let
        list =
            String.split "" str
    in
        countEmUp list 1
            |> String.join ""


decode : String -> String
decode str =
    let
        list =
            String.split "" str
    in
        buildIt list ""
            |> String.join ""


countEmUp : List String -> Int -> List String
countEmUp list count =
    case list of
        [] ->
            list

        x :: xs ->
            if Just x == List.head xs then
                countEmUp xs (count + 1)
            else if count > 1 then
                (toString count) :: (x :: countEmUp xs 1)
            else
                x :: countEmUp xs 1


buildIt : List String -> String -> List String
buildIt list countStr =
    case list of
        [] ->
            list

        x :: xs ->
            if not (String.all isDigit x) then
                (String.repeat (myStringToInt countStr) x) :: buildIt xs ""
            else
                buildIt xs (countStr ++ x)


myStringToInt : String -> Int
myStringToInt str =
    Result.withDefault 1 (String.toInt str)
