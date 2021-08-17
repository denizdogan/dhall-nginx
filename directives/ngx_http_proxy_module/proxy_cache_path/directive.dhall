let Prelude = ../../../Prelude.dhall

let List/unpackOptionals = Prelude.List.unpackOptionals

let Optional/map = Prelude.Optional.map

let Text/concatMapSep = Prelude.Text.concatMapSep

let Text/concatSep = Prelude.Text.concatSep

let Bool/onOff = ../../../utils/Bool/onOff.dhall

let d = ../../../utils/directives.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let Interval = ../../../types/Interval/type.dhall

let Interval/show = ../../../types/Interval/show.dhall

let Size = ../../../types/Size/type.dhall

let Size/show = ../../../types/Size/show.dhall

let type = ./type.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let path = value.path

        let levels =
              if    Natural/isZero (List/length Natural value.levels)
              then  None Text
              else  Some
                      (Text/concatMapSep ":" Natural Natural/show value.levels)

        let use_temp_path =
              Optional/map Bool Text Bool/onOff value.use_temp_path

        let keys_zone =
              Some "${value.keys_zone.name}:${Size/show value.keys_zone.size}"

        let inactive = Optional/map Interval Text Interval/show value.inactive

        let max_size = Optional/map Size Text Size/show value.max_size

        let min_free = Optional/map Size Text Size/show value.min_free

        let manager_files =
              Optional/map Natural Text Natural/show value.manager_files

        let manager_sleep =
              Optional/map Interval Text Interval/show value.manager_sleep

        let manager_threshold =
              Optional/map Interval Text Interval/show value.manager_threshold

        let loader_files =
              Optional/map Natural Text Natural/show value.loader_files

        let loader_sleep =
              Optional/map Natural Text Natural/show value.loader_sleep

        let loader_threshold =
              Optional/map Interval Text Interval/show value.loader_threshold

        let purger = Optional/map Bool Text Bool/onOff value.purger

        let purger_files =
              Optional/map Natural Text Natural/show value.purger_files

        let purger_sleep =
              Optional/map Interval Text Interval/show value.purger_sleep

        let purger_threshold =
              Optional/map Interval Text Interval/show value.purger_threshold

        let optionals =
              [ levels
              , use_temp_path
              , keys_zone
              , inactive
              , max_size
              , min_free
              , manager_files
              , manager_sleep
              , manager_threshold
              , loader_files
              , loader_sleep
              , loader_threshold
              , purger
              , purger_files
              , purger_sleep
              , purger_threshold
              ]

        let params = Text/concatSep " " (List/unpackOptionals Text optionals)

        in  indent n "proxy_cache_path ${path} ${params};"

in  d.makeDirective type make ⫽ { default }
