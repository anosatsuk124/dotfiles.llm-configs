#!/bin/bash
build_cmd="$1"
source="$2"
dist_dir="$3"

dist="$dist_dir/$(echo -e "$(basename "$source")" | perl -pe 's/(.*).dhall/$1/g;')"

$build_cmd <"$source" >"$dist"
