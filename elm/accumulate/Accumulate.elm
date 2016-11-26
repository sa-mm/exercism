module Accumulate exposing (..)


accumulate : (a -> a) -> List a -> List a
accumulate theFunc list =
    case list of
        [] ->
            list

        first :: rest ->
            theFunc first :: accumulate theFunc rest
