#!/usr/bin/env bash

# type check all the code
dhall type --quiet --file "package.dhall" || exit 1

for filename in _tests/**/*.dhall; do
  [ -e "$filename" ] || continue
  input="$filename"
  expected_filename="${filename%.dhall}.conf"
  expected=$(<"$expected_filename")
  output=$(dhall text --file $input)

  # verify that the expected output is produced
  if [[ "$output" != "$expected" ]]; then
    echo "$filename did not produce the expected output in $expected_filename:"
    diff -u <(echo "$expected") <(echo "$output")
    echo "-----------------------------"
    continue
  fi

  # verify that nginx accepts the configuration
  nginx -c "$(realpath $expected_filename)" -t
done
