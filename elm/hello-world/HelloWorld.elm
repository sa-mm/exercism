module HelloWorld exposing (..)


helloWorld : Maybe String -> String
helloWorld name =
    "Hello, " ++ (name |> Maybe.withDefault "World") ++ "!"
