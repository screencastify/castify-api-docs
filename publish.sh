#!/bin/bash
mv demos demos_new && \
  git checkout gh-pages && \
  git rm -r demos && \
  mv demos_new demos && \
  git add demos && \
  git commit -am "Update gh-pages"
