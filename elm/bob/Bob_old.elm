module Bob exposing (..)

import String exposing (..)
import Char exposing (..)
import Regex exposing (..)


hey : String -> String
hey str =
    if String.all isUpper (String.filter isAlpha str) == True && String.isEmpty (String.filter isAlpha str) == False then
        "Whoa, chill out!"
    else if String.endsWith "?" str == True then
        "Sure."
    else if String.trim str == "" then
        "Fine. Be that way!"
    else
        "Whatever."


isAlpha : Char -> Bool
isAlpha c =
    Regex.contains (Regex.regex "[A-Za-z]") (toString c)


isWhitespace : Char -> Bool
isWhitespace c =
    Regex.contains (Regex.regex "[\\s\\t\\n]") (toString c)
