#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0


git clone https://${GITHUB_PAT}@github.com/tonygardella/bookdown_labman.git book-output
cd book-output

cp -r ../_book/* ./

git add --all *

git commit -m"Update the book" || true

git push -q origin master