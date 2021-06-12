let Function/identity = https://prelude.dhall-lang.org/Function/identity.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let indent = ./indent.dhall

let interval = ./interval.dhall

let size = ./size.dhall

let Size = size.Size

let Size/show = size.Size/show

let SizeOrOff = ../types/SizeOrOff.dhall

let TextOrAuto = ../types/TextOrAuto.dhall

let OffOrNoneOrBuiltinOrShared = ../types/OffOrNoneOrBuiltinOrShared.dhall

let OffOrSharedNameSize = ../types/OffOrSharedNameSize.dhall

let OnOrOffOrLeaf = ../types/OnOrOffOrLeaf.dhall

let OnOrOffOrOptionalOrOptionalNoCa =
      ../types/OnOrOffOrOptionalOrOptionalNoCa.dhall

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

        in  { Type = type
            , make
            , opt = opt type make
            , listOpt = listOpt type make
            }

let interval = directive interval.Interval.Type interval.Interval/show

let natural = directive Natural Natural/show

let offOrNoneOrBuiltinOrShared =
      directive
        OffOrNoneOrBuiltinOrShared
        ( λ(value : OffOrNoneOrBuiltinOrShared) →
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

let offOrSharedNameSize =
      directive
        OffOrSharedNameSize
        ( λ(value : OffOrSharedNameSize) →
            merge
              { off = "off"
              , shared =
                  λ(v : { name : Text, size : Size }) →
                    "shared:${v.name}:${Size/show v.size}"
              }
              value
        )

let on_off = directive Bool (λ(value : Bool) → if value then "on" else "off")

let on_off_leaf =
      directive
        OnOrOffOrLeaf
        ( λ(value : OnOrOffOrLeaf) →
            merge { on = "on", off = "off", leaf = "leaf" } value
        )

let onOrOffOrOptionalOrOptionalNoCa =
      directive
        OnOrOffOrOptionalOrOptionalNoCa
        ( λ(value : OnOrOffOrOptionalOrOptionalNoCa) →
            merge
              { on = "on"
              , off = "off"
              , optional = "optional"
              , optional_no_ca = "optional_no_ca"
              }
              value
        )

let size = directive Size Size/show

let sizeOrOff =
      directive
        SizeOrOff
        (λ(v : SizeOrOff) → merge { off = "off", size = Size/show } v)

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
    , offOrNoneOrBuiltinOrShared
    , OffOrNoneOrBuiltinOrShared
    , offOrSharedNameSize
    , OffOrSharedNameSize
    , on_off
    , on_off_leaf
    , onOrOffOrOptionalOrOptionalNoCa
    , OnOrOffOrOptionalOrOptionalNoCa
    , opt
    , size
    , sizeOrOff
    , SizeOrOff
    , sslProtocolList
    , SslProtocol
    , text
    , textOrAuto
    , TextOrAuto
    , textSep
    }
