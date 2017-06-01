#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "tonygardella@gmail.com"

git config --global user.name "Tony Gardella"


BOOK_DIR=$(pwd)/_book

rm -rf ~/_book

mkdir ~/_book && cd ~/_book

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git .

cp -r ${BOOK_DIR}/* ./

git add --all *

git commit -m"update homepage (travis build ${TRAVIS_BUILD_NUMBER})"

git push -q -f origin gh-pages