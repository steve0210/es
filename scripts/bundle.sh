#!/bin/sh

su - rails <<EOF
cd /home/rails/tmp \
  && gem install bundler \
  && bundle
EOF
