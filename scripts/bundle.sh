#!/bin/sh

su - rails <<EOF
cd /home/rails/tmp \
  && gem install bundler -v 1.17.3 \
  && bundle
EOF
