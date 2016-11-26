module Main exposing (..)


blah : List a -> Int
blah list =
    case list of
        [] ->
            0

        first :: rest ->
            1 + (blah rest)


blah2 : List a -> String
blah2 list =
    case list of
        [] ->
            ""

        first :: rest ->
            (blah2 rest) ++ (toString first)



-- if divisors == [] then
--     str
-- else
--     buildString (List.tail divisors) (toString (List.head divisors) ++ str)


repeat' : Int -> a -> List a
repeat' n x =
    if n <= 0 then
        []
    else
        x :: repeat' (n - 1) x


reverse' : List a -> List a
reverse' list =
    case list of
        [] ->
            []

        x :: xs ->
            reverse' xs ++ [ x ]
