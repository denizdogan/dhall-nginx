let List/map =
      https://prelude.dhall-lang.org/List/map.dhall
        sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall
        sha256:0cbaa920f429cf7fc3907f8a9143203fe948883913560e6e1043223e6b3d05e4

let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep.dhall
        sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let default = ./default.dhall

let type = ./type.dhall

let ReturnCode = ./ReturnCode.dhall

let d = ../../../utils/directives.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let codes =
              Text/concatSep " " (List/map Natural Text Natural/show c.codes)

        let return_code =
              merge
                { None = None Text
                , Some =
                    λ(rc : ReturnCode) →
                      Some
                        ( merge
                            { same = "="
                            , other = λ(o : Natural) → "=${Natural/show o}"
                            }
                            rc
                        )
                }
                c.return_code

        let uri = c.uri

        let parts =
              List/unpackOptionals Text [ Some codes, return_code, Some uri ]

        let text = Text/concatSep " " parts

        in  "error_page ${text};"

let error_page = d.makeDirective type make ⫽ { default, ReturnCode }

let example0 =
        assert
      :   error_page.make 0 error_page::{ codes = [ 100, 200 ], uri = "/foo" }
        ≡ "error_page 100 200 /foo;"

let example1 =
        assert
      :   error_page.make
            0
            error_page::{
            , codes = [ 100, 200 ]
            , uri = "/foo"
            , return_code = Some (ReturnCode.other 400)
            }
        ≡ "error_page 100 200 =400 /foo;"

let example2 =
        assert
      :   error_page.make
            0
            error_page::{
            , codes = [ 100 ]
            , uri = "/foo"
            , return_code = Some ReturnCode.same
            }
        ≡ "error_page 100 = /foo;"

in  error_page
