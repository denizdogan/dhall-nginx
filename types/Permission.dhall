let Text/concat = https://prelude.dhall-lang.org/Text/concat.dhall

let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let Optional/if = ../utils/Optional/if.dhall

let rwx = { r : Bool, w : Bool, x : Bool }

let type = { user : rwx, group : rwx, all : rwx }

let showOne =
      λ(prefix : Text) →
      λ(p : rwx) →
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
              [ showOne "user" value.user
              , showOne "group" value.group
              , showOne "all" value.all
              ]
          )

let none = { r = False, w = False, x = False }

let all = { r = True, w = True, x = True }

let example0 = assert : showOne "user" none ≡ None Text

let example1 =
      assert : showOne "user" { r = True, w = False, x = False } ≡ Some "user:r"

let example2 =
      assert : showOne "user" { r = False, w = True, x = False } ≡ Some "user:w"

let example3 =
      assert : showOne "user" { r = False, w = False, x = True } ≡ Some "user:x"

let example4 = assert : showOne "user" all ≡ Some "user:rwx"

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

in  { Type = type, show, none, all }
