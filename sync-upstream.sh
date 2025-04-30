#!/bin/bash

rm -rfv * .*
git clone git@github.com:homeski/ansible-collection-escwq-kubemanifests.git .
rm -rfv .git
find . -type f -exec sed -i '' 's/escwq/aap/g' {} +
