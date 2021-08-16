let Prelude = ../../Prelude.dhall

let List/unpackOptionals = Prelude.List.unpackOptionals

let Text/concat = Prelude.Text.concat

let Optional/if = ../../utils/Optional/if.dhall

let type = ./type.dhall

let show =
      λ(p : type) →
        let lst =
              List/unpackOptionals
                Text
                [ Optional/if Text p.r "r"
                , Optional/if Text p.w "w"
                , Optional/if Text p.x "x"
                ]

        in  Text/concat lst

in  show
