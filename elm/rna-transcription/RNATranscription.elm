module RNATranscription exposing (toRNA)

import Dict
import String


lookupRNA =
    Dict.fromList [ ( 'C', "G" ), ( 'G', "C" ), ( 'T', "A" ), ( 'A', "U" ) ]


toRNA : String -> Result Char String
toRNA strand =
    -- Base recusursive case
    case String.uncons strand of
        Nothing ->
            Ok ""

        Just ( head, tail ) ->
            -- Return an error for bad characters
            case Dict.get head lookupRNA of
                Nothing ->
                    Err head

                Just transcribed ->
                    -- Pass the error up the chain if needed
                    case toRNA tail of
                        Err err ->
                            Err err

                        Ok suffix ->
                            Ok (transcribed ++ suffix)
