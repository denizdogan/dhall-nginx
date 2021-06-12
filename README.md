# dhall-nginx

Generate your Nginx configuration files using Dhall.

Loosely based on [torbencarstens/dhall-nginx](https://github.com/torbencarstens/dhall-nginx).

[![Build](https://github.com/denizdogan/dhall-nginx/actions/workflows/build_example.yml/badge.svg)](https://github.com/denizdogan/dhall-nginx/actions/workflows/build_example.yml)

## Usage

See [example 1](./_tests/example/example1.dhall) and its accompanying [.conf file](./_tests/example/example1.conf) for example input and output.

```console
$ dhall text --file config.dhall
```

## Documentation

### Examples

The easiest way to get started is probably by looking at the examples in [./_tests/](./_tests/) where you can find pairings of Dhall input files and their output Nginx configurations. Note that some of the output files will look slightly different from what they were based on, because this library doesn't support e.g. `include` directives -- instead of that, just use Dhall's mechanisms to "include" parts.

- **example** - just a random configuration
- **ruby_fcgi** - [Simple Ruby FCGI](https://www.nginx.com/resources/wiki/start/topics/examples/simplerubyfcgi/)
- **nginx** - [Full Example Configuration](https://www.nginx.com/resources/wiki/start/topics/examples/full/)
- **wordpress** - [Wordpress recipe](https://www.nginx.com/resources/wiki/start/topics/recipes/wordpress/)

### Access rules (`allow` and `deny`)

Since the internal order of the `allow` and `deny` directives matters, they are configured as a list of "access rules". Their common type is called [`access_rule`](./directives/ngx_http_access_module/access_rule/type.dhall).

### `/etc/nginx/fastcgi_params`

A Dhall version of the default `/etc/nginx/fastcgi_params` has been included in [utils/helpers/fastcgi_params.dhall](./utils/helpers/fastcgi_params.dhall).

### `mime.types`

A Dhall version of the default `mime.types` has been included in [utils/helpers/mime_types.dhall](./utils/helpers/mime_types.dhall).

## Missing features

- **Help wanted:** No nested `location` blocks because [recursion is hard in Dhall](https://docs.dhall-lang.org/howtos/How-to-translate-recursive-code-to-Dhall.html), and [named locations cannot have sub-location blocks](https://nginx.org/en/docs/http/ngx_http_core_module.html#location), making it even harder.
- **Not going to happen:** No `if` statements: because [if is evil](https://www.nginx.com/resources/wiki/start/topics/depth/ifisevil/), and it would turn the configuration file into an imperative script rather than a declarative description.
