let access_rule = ./access_rule/package.dhall

let allow = \(s : Text) -> access_rule::{ allow = Some s }

let deny = \(s : Text) -> access_rule::{ deny = Some s }

in  { access_rule, allow, deny }
