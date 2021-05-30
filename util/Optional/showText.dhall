let Optional/fold = https://prelude.dhall-lang.org/Optional/fold.dhall

in  λ(value : Optional Text) →
      Optional/fold Text value Text (λ(t : Text) → t) ""
