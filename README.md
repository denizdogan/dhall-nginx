# dhall-nginx

## To do

Easy:

- [ ] Support `if` parameter for `access_log` directive

Medium:

- [ ] Make log_format a map between log name and configuration

Hard:

- [ ] Add recursive data type for handling blocks, directives and their indentation
- [ ] Add support for recursive `location` -- except for named locations (`@name`)

## Development

Each directive record can have one or more of the follow functions:

- `make` - return `Text` representation of the directive
- `makeMany` - return `Text` representation of a list of directives
- `opt` - return `None Text` if the value is `None a`, otherwise return `Some Text`
