let Text/spaces =
      https://prelude.dhall-lang.org/Text/spaces.dhall sha256:fccfd4f26601e006bf6a79ca948dbd37c676cdd0db439554447320293d23b3dc

let indent = λ(n : Natural) → λ(t : Text) → Text/spaces n ++ t

in  indent
