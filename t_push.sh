#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_files() {
  git add *.pdf
  git commit --message "[travis skip] Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  echo $GH_TOKEN
  git remote rm origin
  git remote add origin https://andreweggleston:${GH_TOKEN}@github.com/andreweggleston/cv.git
  git push --set-upstream origin master
}

setup_git
commit_files
upload_files
