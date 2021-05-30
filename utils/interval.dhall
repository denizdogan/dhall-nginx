let Text/concat = https://prelude.dhall-lang.org/Text/concat.dhall

let Interval =
      { Type =
          { milliseconds : Optional Natural
          , seconds : Optional Natural
          , minutes : Optional Natural
          , hours : Optional Natural
          , days : Optional Natural
          , weeks : Optional Natural
          , months : Optional Natural
          , years : Optional Natural
          }
      , default =
        { milliseconds = None Natural
        , seconds = None Natural
        , minutes = None Natural
        , hours = None Natural
        , days = None Natural
        , weeks = None Natural
        , months = None Natural
        , years = None Natural
        }
      }

let Interval/show =
      λ(ti : Interval.Type) →
        let opt =
              λ(v : Optional Natural) →
              λ(u : Text) →
                merge
                  { None = "", Some = λ(s : Natural) → Natural/show s ++ u }
                  v

        in  Text/concat
              [ opt ti.years "y"
              , opt ti.months "M"
              , opt ti.weeks "w"
              , opt ti.days "d"
              , opt ti.hours "h"
              , opt ti.minutes "m"
              , opt ti.seconds "s"
              , opt ti.milliseconds "ms"
              ]

let example0 = assert : Interval/show Interval::{=} ≡ ""

let example1 = assert : Interval/show Interval::{ years = Some 2 } ≡ "2y"

let example2 = assert : Interval/show Interval::{ months = Some 2 } ≡ "2M"

let example3 = assert : Interval/show Interval::{ weeks = Some 2 } ≡ "2w"

let example4 = assert : Interval/show Interval::{ days = Some 2 } ≡ "2d"

let example5 = assert : Interval/show Interval::{ hours = Some 2 } ≡ "2h"

let example6 = assert : Interval/show Interval::{ minutes = Some 2 } ≡ "2m"

let example7 = assert : Interval/show Interval::{ seconds = Some 2 } ≡ "2s"

let example8 =
      assert : Interval/show Interval::{ milliseconds = Some 2 } ≡ "2ms"

let example9 =
        assert
      :   Interval/show
            Interval::{
            , years = Some 11
            , months = Some 3
            , weeks = Some 40
            , days = Some 13
            , hours = Some 8
            , minutes = Some 0
            , seconds = Some 791
            , milliseconds = Some 14
            }
        ≡ "11y3M40w13d8h0m791s14ms"

in  { Interval, Interval/show }
