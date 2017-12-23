#!/bin/sh

mix credo --strict
mix dogma
mix coveralls
