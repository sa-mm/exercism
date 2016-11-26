module DifferenceOfSquares exposing (..)


squareOfSum : Int -> Int
squareOfSum num =
    List.sum [1..num]
        |> square


sumOfSquares : Int -> Int
sumOfSquares num =
    List.map square [1..num]
        |> List.sum


difference : Int -> Int
difference num =
    squareOfSum num - sumOfSquares num


square : Int -> Int
square num =
    num ^ 2
