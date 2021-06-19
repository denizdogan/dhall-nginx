let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall sha256:0cbaa920f429cf7fc3907f8a9143203fe948883913560e6e1043223e6b3d05e4

let Text/concat =
      https://prelude.dhall-lang.org/Text/concat.dhall sha256:731265b0288e8a905ecff95c97333ee2db614c39d69f1514cb8eed9259745fc0

let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep.dhall sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let Optional/if = ../../utils/Optional/if.dhall

let type = ./type.dhall

let RWX = ../RWX/type.dhall

let utils = ../RWX/utils.dhall

let none = utils.none

let all = utils.all

let RWX/opt =
      λ(prefix : Text) →
      λ(p : RWX) →
        let lst =
              List/unpackOptionals
                Text
                [ Optional/if Text p.r "r"
                , Optional/if Text p.w "w"
                , Optional/if Text p.x "x"
                ]

        in  if    Natural/isZero (List/length Text lst)
            then  None Text
            else  Some (prefix ++ ":" ++ Text/concat lst)

let show =
      λ(value : type) →
        Text/concatSep
          " "
          ( List/unpackOptionals
              Text
              [ RWX/opt "user" value.user
              , RWX/opt "group" value.group
              , RWX/opt "all" value.all
              ]
          )

let example0 = assert : RWX/opt "user" none ≡ None Text

let example1 =
      assert : RWX/opt "user" { r = True, w = False, x = False } ≡ Some "user:r"

let example2 =
      assert : RWX/opt "user" { r = False, w = True, x = False } ≡ Some "user:w"

let example3 =
      assert : RWX/opt "user" { r = False, w = False, x = True } ≡ Some "user:x"

let example4 = assert : RWX/opt "user" all ≡ Some "user:rwx"

let example5 =
        assert
      :   show
            { user = { r = False, w = True, x = True }
            , group = { r = True, w = True, x = False }
            , all = { r = True, w = False, x = False }
            }
        ≡ "user:wx group:rw all:r"

let example6 =
        assert
      : show { user = all, group = all, all } ≡ "user:rwx group:rwx all:rwx"

let example7 = assert : show { user = none, group = none, all = none } ≡ ""

in  show
