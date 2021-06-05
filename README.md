# dhall-nginx

Generate your Nginx configuration files using Dhall.

Loosely based on [torbencarstens/dhall-nginx](https://github.com/torbencarstens/dhall-nginx).

## Usage

See [example 1](./_tests/example/example1.dhall) and its accompanying [.conf file](./_tests/example/example1.conf) for example input and output.

```console
$ dhall text --file config.dhall
```

## Documentation

- A Dhall version of the default `/etc/nginx/fastcgi_params` has been included in [utils/fastcgi_params.dhall](./utils/fastcgi_params.dhall).

## Missing features

- **Help wanted:** No nested `location` blocks because [recursion is hard in Dhall](https://docs.dhall-lang.org/howtos/How-to-translate-recursive-code-to-Dhall.html), and [named locations cannot have sub-location blocks](https://nginx.org/en/docs/http/ngx_http_core_module.html#location), making it even harder.
- **Not going to happen:** No `if` statements: because [if is evil](https://www.nginx.com/resources/wiki/start/topics/depth/ifisevil/), and it would turn the configuration file into an imperative script rather than a declarative description.
