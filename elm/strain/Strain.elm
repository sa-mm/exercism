module Strain exposing (..)


keep : (a -> Bool) -> List a -> List a
keep func list =
    case list of
        [] ->
            list

        car :: cdr ->
            if func car then
                car :: keep func cdr
            else
                keep func cdr


discard : (a -> Bool) -> List a -> List a
discard func list =
    keep (func >> not) list



-- case list of
--     [] ->
--         list
--
--     car :: cdr ->
--         if func car then
--             discard func cdr
--         else
--             car :: discard func cdr
