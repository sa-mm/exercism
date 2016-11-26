module SumOfMultiples exposing (..)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples factors limit =
    makeList factors limit
        |> List.concat
        |> List.foldl dedup []
        |> List.sum


makeList : List Int -> Int -> List (List Int)
makeList factors limit =
    case factors of
        [] ->
            []

        x :: xs ->
            multiples x 1 limit :: makeList xs limit


multiples : Int -> Int -> Int -> List Int
multiples n inc limit =
    if (n * inc) < limit then
        (n * inc) :: (multiples n (inc + 1) limit)
    else
        []


dedup : Int -> List Int -> List Int
dedup num acc =
    if List.member num acc then
        acc
    else
        num :: acc
