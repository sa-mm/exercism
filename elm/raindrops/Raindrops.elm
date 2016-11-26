module Raindrops exposing (..)


raindrops : Int -> String
raindrops n =
    if (by 3 n || by 5 n || by 7 n) then
        buildString [ 3, 5, 7 ] n
    else
        toString n


buildString : List Int -> Int -> String
buildString divisors num =
    case divisors of
        [] ->
            ""

        divisor :: rest ->
            if by 3 num && divisor == 3 then
                "Pling" ++ (buildString rest num)
            else if by 5 num && divisor == 5 then
                "Plang" ++ (buildString rest num)
            else if by 7 num && divisor == 7 then
                "Plong" ++ (buildString rest num)
            else
                buildString rest num


by : Int -> Int -> Bool
by divisor n =
    n % divisor == 0
