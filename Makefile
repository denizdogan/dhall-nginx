test:
	./test.sh

lint:
	fd -g "*.dhall" -0 | xargs -0 -I '{}' dhall lint --inplace {}

freeze:
	fd -g "*.dhall" -0 | xargs -0 -I '{}' dhall freeze --inplace {}

format:
	fd -g "*.dhall" -0 | xargs -0 -I '{}' dhall format --inplace {}
