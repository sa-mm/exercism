module DifferenceOfSquares exposing (..)


squareOfSum : Float -> Float
squareOfSum n =
    let
        sum =
            (n * n + n) / 2
    in
        sum * sum


sumOfSquares : Float -> Float
sumOfSquares n =
    n * (n + 1) * (n + n + 1) / 6


difference : Float -> Float
difference n =
    squareOfSum n - sumOfSquares n
