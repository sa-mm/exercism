module Triangle exposing (..)


version : Int
version =
    2


type Triangle
    = Equilateral
    | Scalene
    | Isosceles


triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind a b c =
    if invalidLengths a b c then
        Err "Invalid lengths"
    else if violatesInequality a b c then
        Err "Violates inequality"
    else if isEquilateral a b c then
        Ok Equilateral
    else if isIsosceles a b c then
        Ok Isosceles
    else if isScalene a b c then
        Ok Scalene
    else
        Err "Something went wrong."


invalidLengths : Float -> Float -> Float -> Bool
invalidLengths a b c =
    (a <= 0) || (b <= 0) || (c <= 0)


violatesInequality : Float -> Float -> Float -> Bool
violatesInequality a b c =
    [ a, b, c ]
        |> List.sort
        |> List.reverse
        |> checkSides


checkSides : List Float -> Bool
checkSides list =
    case list of
        hd :: tl ->
            hd >= List.sum (tl)

        [] ->
            False


isEquilateral : Float -> Float -> Float -> Bool
isEquilateral a b c =
    (a == b) && (a == c)


isIsosceles : Float -> Float -> Float -> Bool
isIsosceles a b c =
    (a == b) || (a == c) || (b == c)


isScalene : Float -> Float -> Float -> Bool
isScalene a b c =
    a /= b && a /= c && b /= c
