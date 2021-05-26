# dhall-nginx

**This is still in a really early stage. PRs/issues are welcome.**

## Tryout some of the examples

`dhall text <<< './Server/makeServer ./Server/Spec.example'`

```nginx
server {
      server_name example.com;
      listen address3000;

      error_log /var/log/nginx/example.com_error.log;
  
      location ~* ^/admin {
        rewrite regex replacement;
        add_header X-Custom Custom;

        proxy_set_header X-Forward-Proto https;

        proxy_pass localhost:3000;
    }

}
```

## Content

Every directory contains a `Spec` file which is the specification for the folder `name`, i.e. `Location/Spec` is the specification for the `location` directive.

Most directories contain a `Spec.empty` and `Spec.example` file, where `.empty` populates the record with default values and `.example` provides a record with example values.
