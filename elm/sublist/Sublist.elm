module Sublist exposing (..)


type ListComparison
    = Equal
    | Sublist
    | Superlist
    | Unequal


version : Int
version =
    2


sublist : List a -> List a -> ListComparison
sublist listA listB =
    if listA == listB then
        Equal
    else
        Sublist
