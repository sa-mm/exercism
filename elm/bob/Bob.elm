module Bob exposing (..)

import String exposing (endsWith, toUpper, toLower, trim, isEmpty)


type Mood
    = Questioning
    | Shouting
    | Silence
    | Neutral


hey : String -> String
hey statement =
    case examine statement of
        Questioning ->
            "Sure."

        Shouting ->
            "Whoa, chill out!"

        Silence ->
            "Fine. Be that way!"

        Neutral ->
            "Whatever."


examine : String -> Mood
examine statement =
    if isShout statement then
        Shouting
    else if isQuestion statement then
        Questioning
    else if isSilent statement then
        Silence
    else
        Neutral


isQuestion : String -> Bool
isQuestion statement =
    endsWith "?" statement


isShout : String -> Bool
isShout statement =
    toUpper statement == statement && toLower statement /= statement


isSilent : String -> Bool
isSilent statement =
    trim statement |> isEmpty
