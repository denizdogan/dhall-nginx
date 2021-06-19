let show = ./show.dhall

let package =
      { default = ./default.dhall
      , show
      , Type = ./type.dhall
      , type = ./type.dhall
      }

let example0 = assert : show package::{=} === ""

let example1 = assert : show package::{ years = Some 2 } === "2y"

let example2 = assert : show package::{ months = Some 2 } === "2M"

let example3 = assert : show package::{ weeks = Some 2 } === "2w"

let example4 = assert : show package::{ days = Some 2 } === "2d"

let example5 = assert : show package::{ hours = Some 2 } === "2h"

let example6 = assert : show package::{ minutes = Some 2 } === "2m"

let example7 = assert : show package::{ seconds = Some 2 } === "2s"

let example8 = assert : show package::{ milliseconds = Some 2 } === "2ms"

let example9 =
        assert
      :     show
              package::{
              , years = Some 11
              , months = Some 3
              , weeks = Some 40
              , days = Some 13
              , hours = Some 8
              , minutes = Some 0
              , seconds = Some 791
              , milliseconds = Some 14
              }
        ===  "11y3M40w13d8h0m791s14ms"

in  package
