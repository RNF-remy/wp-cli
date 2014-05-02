#!/bin/bash

set -ex

cat script.gdb | sudo gdb –args ~/.phpenv/versions/$(phpenv version-name)/bin/php ~/.phpenv/versions/$(phpenv version-name)/bin/phpunit

# Run the unit tests
vendor/bin/phpunit

# Run the functional tests
vendor/bin/behat --format progress

# Run CodeSniffer
./codesniffer/scripts/phpcs --standard=./ci/ php/
