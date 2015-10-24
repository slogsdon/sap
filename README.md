# Sap
[![Build Status](https://img.shields.io/travis/slogsdon/sap.svg?style=flat)](https://travis-ci.org/slogsdon/sap)
[![Coverage Status](https://img.shields.io/coveralls/slogsdon/sap.svg?style=flat)](https://coveralls.io/r/slogsdon/sap)
[![Hex.pm Version](http://img.shields.io/hexpm/v/sap.svg?style=flat)](https://hex.pm/packages/sap)
[![Inline docs](http://inch-ci.org/github/slogsdon/sap.svg?branch=master)](http://inch-ci.org/github/slogsdon/sap)

Sap is a toolkit for Plug applications to accept and respond to HTTP requests by using a decision tree built with combinators.

## Inspiration

This may look familiar to experienced functional programmers. [Suave](http://suave.io) from F# and other similar libraries contain a set of combinators to manipulate route flow and task composition.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add sap to your list of dependencies in `mix.exs`:

        def deps do
          [{:sap, "~> 0.0.1"}]
        end

  2. Ensure sap is started before your application:

        def application do
          [applications: [:sap]]
        end

## License

Sap is released under the MIT License.

See [LICENSE](https://github.com/slogsdon/sap/blob/master/LICENSE) for details.
