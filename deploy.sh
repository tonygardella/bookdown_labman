#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
echo ${TRAVIS_BRANCH}
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "tonygardella@gmail.com"

git config --global user.name "Tony Gardella"


git clone https://${GITHUB_PAT}@github.com/tonygardella/bookdown_labman.git book-output
cd book-output

cp -r ../_book/* ./

git add --all *

git commit -m "Update the book" || true

git push -q origin master