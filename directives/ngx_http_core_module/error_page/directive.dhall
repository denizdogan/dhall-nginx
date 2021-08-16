let Prelude = ../../../Prelude.dhall

let List/map = Prelude.List.map

let List/unpackOptionals = Prelude.List.unpackOptionals

let Text/concatSep = Prelude.Text.concatSep

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
