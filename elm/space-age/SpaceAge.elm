module SpaceAge exposing (..)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


ageOn : Planet -> Float -> Float
ageOn planet age =
    case planet of
        Earth ->
            planetYears age 1

        Mercury ->
            planetYears age 0.2408467

        Venus ->
            planetYears age 0.61519726

        Mars ->
            planetYears age 1.8808158

        Jupiter ->
            planetYears age 11.862615

        Saturn ->
            planetYears age 29.447498

        Uranus ->
            planetYears age 84.016846

        Neptune ->
            planetYears age 164.79132


planetYears : Float -> Float -> Float
planetYears age period =
    age / (31557600 * period)
