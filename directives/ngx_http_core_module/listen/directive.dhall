let indent = ../../../utils/indent.dhall

let type = ./type.dhall

let addressSchema = ./variants/address/schema.dhall

let portSchema = ./variants/port/schema.dhall

let unixPathSchema = ./variants/unixPath/schema.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let handlers =
              { Address = addressSchema.make n
              , Port = portSchema.make n
              , UnixPath = unixPathSchema.make n
              }

        let text = merge handlers value

        in  indent n "listen ${text};"

in  { Port = portSchema
    , Address = addressSchema
    , UnixPath = unixPathSchema
    , make
    , type
    , address = λ(a : Text) → type.Address addressSchema::{ address = a }
    , addressPort =
        λ(a : Text) →
        λ(p : Natural) →
          type.Address addressSchema::{ address = a, port = Some p }
    , port = λ(p : Natural) → type.Port portSchema::{ port = p }
    , unixPath = λ(u : Text) → type.UnixPath unixPathSchema::{ unixPath = u }
    }
