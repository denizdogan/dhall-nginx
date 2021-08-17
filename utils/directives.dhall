let Prelude = ../Prelude.dhall

let Function/identity = Prelude.Function.identity

let List/map = Prelude.List.map

let Optional/map = Prelude.Optional.map

let Text/concatSep = Prelude.Text.concatSep

let indent = ./indent.dhall

let DebugPoints = ../types/DebugPoints/type.dhall

let DebugPoints/show = ../types/DebugPoints/show.dhall

let Interval = ../types/Interval/type.dhall

let Interval/show = ../types/Interval/show.dhall

let ConnectionProcessingMethod = ../types/ConnectionProcessingMethod/type.dhall

let ConnectionProcessingMethod/show =
      ../types/ConnectionProcessingMethod/show.dhall

let LingeringClose = ../types/LingeringClose/type.dhall

let LingeringClose/show = ../types/LingeringClose/show.dhall

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

let debugPoints = directive DebugPoints DebugPoints/show

let interval = directive Interval Interval/show

let integer = directive Integer Integer/show

let lingeringClose = directive LingeringClose LingeringClose/show

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

in  { debugPoints
    , interval
    , natural
    , makeDirective
    , lingeringClose
    , listOpt
    , offNoneBuiltinShared
    , offSharedNameSize
    , connectionProcessingMethod
    , bool
    , integer
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
