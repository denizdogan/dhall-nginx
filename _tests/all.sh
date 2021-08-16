#!/usr/bin/env bash

# check if --nginx was passed
test_nginx=false
if [[ "$1" = "--nginx" ]]; then
  test_nginx=true
fi

# type check all the code
echo "Type-checking everything..."
dhall type --quiet --file "package.dhall" || exit 1

# run the test suites
for filename in _tests/**/*.dhall; do
  [ -e "$filename" ] || continue
  echo "Testing $filename..."
  input="$filename"
  expected_filename="${filename%.dhall}.conf"
  expected=$(<"$expected_filename")
  output=$(dhall text --file $input)

  # verify that the expected output is produced
  if [[ "$output" != "$expected" ]]; then
    echo "$filename did not produce the expected output in $expected_filename:"
    diff -u <(echo "$expected") <(echo "$output")
    exit 1
    continue
  fi

  # if requested, verify that nginx accepts the configuration
  if [[ "$test_nginx" = true ]]; then
    nginx -c "$(realpath $expected_filename)" -t -q
  fi
done
