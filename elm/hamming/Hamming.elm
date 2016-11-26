module Hamming exposing (..)

import String exposing (toList, length)


distance : String -> String -> Maybe Int
distance str1 str2 =
    case length str1 /= length str2 of
        True ->
            Nothing

        False ->
            List.map2 (==) (str1 |> toList) (str2 |> toList)
                |> List.map
                    (\same ->
                        if same then
                            0
                        else
                            1
                    )
                |> List.sum
                |> Just
