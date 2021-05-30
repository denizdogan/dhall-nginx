let Text/spaces = https://prelude.dhall-lang.org/Text/spaces.dhall

let type = { level : Natural, text : Text }

let Indent =
      { Type = type
      , default = {=}
      , make = \(i : type) -> Text/spaces i.level i.text
      }

let i = Indent::{ level = 4, text = "foobar" }

in  Indent.make i
