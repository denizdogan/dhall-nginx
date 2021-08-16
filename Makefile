test:
	./test.sh

lint:
	fd -g "*.dhall" -0 | xargs -0 -I '{}' dhall lint {}

freeze:
	fd -g "*.dhall" -0 | xargs -0 -I '{}' dhall freeze {}

format:
	fd -g "*.dhall" -0 | xargs -0 -I '{}' dhall format {}
