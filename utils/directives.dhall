let Function/identity =
      https://prelude.dhall-lang.org/Function/identity.dhall sha256:f78b96792b459cb664f41c6119bd8897dd04353a3343521d436cd82ad71cb4d4

let List/map =
      https://prelude.dhall-lang.org/List/map.dhall sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Optional/map =
      https://prelude.dhall-lang.org/Optional/map.dhall sha256:501534192d988218d43261c299cc1d1e0b13d25df388937add784778ab0054fa

let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep.dhall sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let indent = ./indent.dhall

let Interval = ../types/Interval/type.dhall

let Interval/show = ../types/Interval/show.dhall

let ConnectionProcessingMethod = ../types/ConnectionProcessingMethod/type.dhall

let ConnectionProcessingMethod/show =
      ../types/ConnectionProcessingMethod/show.dhall

let Permission = ../types/Permission/type.dhall

let Permission/show = ../types/Permission/show.dhall

let SizeOff = ../types/SizeOff/type.dhall

let SizeOff/show = ../types/SizeOff/show.dhall

let TempPathLevels = ../types/TempPathLevels/type.dhall

let TempPathLevels/show = ../types/TempPathLevels/show.dhall

let TextAuto = ../types/TextAuto/type.dhall

let TextAuto/show = ../types/TextAuto/show.dhall

let OffNoneBuiltinShared = ../types/OffNoneBuiltinShared/type.dhall

let OffNoneBuiltinShared/show = ../types/OffNoneBuiltinShared/show.dhall

let OffSharedNameSize = ../types/OffSharedNameSize/type.dhall

let OffSharedNameSize/show = ../types/OffSharedNameSize/show.dhall

let OnOffLeaf = ../types/OnOffLeaf/type.dhall

let OnOffLeaf/show = ../types/OnOffLeaf/show.dhall

let OnOffOptionalNoCa = ../types/OnOffOptionalNoCa/type.dhall

let OnOffOptionalNoCa/show = ../types/OnOffOptionalNoCa/show.dhall

let OnOffString = ../types/OnOffString/type.dhall

let OnOffString/show = ../types/OnOffString/show.dhall

let SSLProtocol = ../types/SSLProtocol/type.dhall

let SSLProtocol/show = ../types/SSLProtocol/show.dhall

let Size = ../types/Size/type.dhall

let Size/show = ../types/Size/show.dhall

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

let interval = directive Interval Interval/show

let natural = directive Natural Natural/show

let offNoneBuiltinShared =
      directive OffNoneBuiltinShared OffNoneBuiltinShared/show

let offSharedNameSize = directive OffSharedNameSize OffSharedNameSize/show

let bool = directive Bool (λ(value : Bool) → if value then "on" else "off")

let connectionProcessingMethod =
      directive ConnectionProcessingMethod ConnectionProcessingMethod/show

let onOffLeaf = directive OnOffLeaf OnOffLeaf/show

let onOffOptionalNoCa = directive OnOffOptionalNoCa OnOffOptionalNoCa/show

let onOffString = directive OnOffString OnOffString/show

let permission = directive Permission Permission/show

let size = directive Size Size/show

let sizeOff = directive SizeOff SizeOff/show

let sslProtocolList =
      directive
        (List SSLProtocol)
        ( λ(v : List SSLProtocol) →
            Text/concatSep " " (List/map SSLProtocol Text SSLProtocol/show v)
        )

let tempPathLevels =
      λ(name : Text) →
          directive TempPathLevels TempPathLevels/show name
        ⫽ { default.levels = [] : List Natural }

let textAuto = directive TextAuto TextAuto/show

let text = directive Text (Function/identity Text)

let textSep =
      λ(sep : Text) →
        directive (List Text) (λ(ss : List Text) → Text/concatSep sep ss)

in  { interval
    , natural
    , makeDirective
    , listOpt
    , offNoneBuiltinShared
    , offSharedNameSize
    , connectionProcessingMethod
    , bool
    , nil
    , onOffLeaf
    , onOffOptionalNoCa
    , onOffString
    , opt
    , permission
    , size
    , sizeOff
    , sslProtocolList
    , tempPathLevels
    , text
    , textAuto
    , textSep
    }
