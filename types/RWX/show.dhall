let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall
        sha256:0cbaa920f429cf7fc3907f8a9143203fe948883913560e6e1043223e6b3d05e4

let Text/concat =
      https://prelude.dhall-lang.org/Text/concat.dhall
        sha256:731265b0288e8a905ecff95c97333ee2db614c39d69f1514cb8eed9259745fc0

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
