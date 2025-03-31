#!/bin/bash
build_cmd="$1"
source="$2"

dist_file=$(echo -e "$source" | perl -pe 's/(.*).dhall/$1/g;')

$build_cmd <"$source" >"$dist_file"
