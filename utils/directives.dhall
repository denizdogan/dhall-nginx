let Function/identity = https://prelude.dhall-lang.org/Function/identity.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let Text/concat = https://prelude.dhall-lang.org/Text/concat.dhall

let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let indent = ./indent.dhall

let interval = ./interval.dhall

let size = ./size.dhall

let Size = size.Size

let Size/show = size.Size/show

let ConnectionProcessingMethod = ../types/ConnectionProcessingMethod.dhall

let Permission = ../types/Permission.dhall

let SizeOff = ../types/SizeOff.dhall

let TempPathAndLevels = ../types/TempPathAndLevels.dhall

let TextOrAuto = ../types/TextOrAuto.dhall

let OffNoneBuiltinShared = ../types/OffNoneBuiltinShared.dhall

let OffSharedNameSize = ../types/OffSharedNameSize.dhall

let OnOffLeaf = ../types/OnOffLeaf.dhall

let OnOffOptionalNoCa = ../types/OnOffOptionalNoCa.dhall

let SslProtocol = ../types/SslProtocol.dhall

let opt =
      λ(t : Type) →
      λ(make : Natural → t → Text) →
      λ(v : Optional t) →
      λ(n : Natural) →
        Optional/map t Text (make n) v

let listOpt =
      λ(t : Type) →
      λ(make : Natural → t → Text) →
      λ(values : List t) →
      λ(n : Natural) →
        if    Natural/isZero (List/length t values)
        then  None Text
        else  Some (Text/concatSep "\n" (List/map t Text (make n) values))

let makeDirective =
      λ(type : Type) →
      λ(make : Natural → type → Text) →
        { Type = type, make, opt = opt type make, listOpt = listOpt type make }

let directive =
      λ(type : Type) →
      λ(f : type → Text) →
      λ(name : Text) →
        let make =
              λ(n : Natural) →
              λ(value : type) →
                let text = f value in indent n "${name} ${text};"

        in  makeDirective type make

let nil =
      λ(name : Text) →
        let type = {}

        let make = λ(n : Natural) → λ(_ : type) → indent n "${name};"

        in  makeDirective type make

let interval = directive interval.Interval.Type interval.Interval/show

let natural = directive Natural Natural/show

let offNoneBuiltinShared =
      directive
        OffNoneBuiltinShared
        ( λ(value : OffNoneBuiltinShared) →
            merge
              { off = "off"
              , none = "none"
              , builtin = λ(v : Size) → "builtin:${Size/show v}"
              , shared =
                  λ(v : { name : Text, size : Size }) →
                    "shared:${v.name}:${Size/show v.size}"
              }
              value
        )

let offSharedNameSize =
      directive
        OffSharedNameSize
        ( λ(value : OffSharedNameSize) →
            merge
              { off = "off"
              , shared =
                  λ(v : { name : Text, size : Size }) →
                    "shared:${v.name}:${Size/show v.size}"
              }
              value
        )

let bool = directive Bool (λ(value : Bool) → if value then "on" else "off")

let connectionProcessingMethod =
      directive
        ConnectionProcessingMethod
        ( λ(value : ConnectionProcessingMethod) →
            merge
              { select = "select"
              , poll = "poll"
              , kqueue = "kqueue"
              , epoll = "epoll"
              , devpoll = "/dev/poll"
              , eventport = "eventport"
              }
              value
        )

let onOffLeaf =
      directive
        OnOffLeaf
        ( λ(value : OnOffLeaf) →
            merge { on = "on", off = "off", leaf = "leaf" } value
        )

let onOffOptionalNoCa =
      directive
        OnOffOptionalNoCa
        ( λ(value : OnOffOptionalNoCa) →
            merge
              { on = "on"
              , off = "off"
              , optional = "optional"
              , optional_no_ca = "optional_no_ca"
              }
              value
        )

let permission = directive Permission.Type Permission.show

let size = directive Size Size/show

let sizeOff =
      directive
        SizeOff
        (λ(v : SizeOff) → merge { off = "off", size = Size/show } v)

let sslProtocolList =
      directive
        (List SslProtocol)
        ( λ(v : List SslProtocol) →
            Text/concatSep
              " "
              ( List/map
                  SslProtocol
                  Text
                  ( λ(s : SslProtocol) →
                      merge
                        { SSLv2 = "SSLv2"
                        , SSLv3 = "SSLv3"
                        , TLSv1 = "TLSv1"
                        , TLSv11 = "TLSv11"
                        , TLSv12 = "TLSv12"
                        , TLSv13 = "TLSv13"
                        }
                        s
                  )
                  v
              )
        )

let tempPathAndLevels =
      λ(name : Text) →
          directive
            TempPathAndLevels
            ( λ(value : TempPathAndLevels) →
                let path = value.path

                let levels =
                      Text/concat
                        ( List/map
                            Natural
                            Text
                            (λ(level : Natural) → " ${Natural/show level}")
                            value.levels
                        )

                in  "${path}${levels}"
            )
            name
        ⫽ { default.levels = [] : List Natural }

let textOrAuto =
      directive
        TextOrAuto
        ( λ(v : TextOrAuto) →
            merge { auto = "auto", text = Function/identity Text } v
        )

let text = directive Text (Function/identity Text)

let textSep =
      λ(sep : Text) →
        directive (List Text) (λ(ss : List Text) → Text/concatSep sep ss)

in  { interval
    , natural
    , makeDirective
    , listOpt
    , offNoneBuiltinShared
    , OffNoneBuiltinShared
    , offSharedNameSize
    , OffSharedNameSize
    , connectionProcessingMethod
    , bool
    , nil
    , onOffLeaf
    , onOffOptionalNoCa
    , OnOffOptionalNoCa
    , opt
    , permission
    , size
    , sizeOff
    , SizeOff
    , sslProtocolList
    , SslProtocol
    , tempPathAndLevels
    , TempPathAndLevels
    , text
    , textOrAuto
    , TextOrAuto
    , textSep
    }
