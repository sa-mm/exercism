module Leap exposing (..)


type Year
    = LeapYear
    | NonLeapYear


isLeapYear : Int -> Bool
isLeapYear year =
    case examine year of
        LeapYear ->
            True

        NonLeapYear ->
            False


examine : Int -> Year
examine year =
    if rem year 400 == 0 then
        LeapYear
    else if rem year 100 == 0 then
        NonLeapYear
    else if rem year 4 == 0 then
        LeapYear
    else
        NonLeapYear
