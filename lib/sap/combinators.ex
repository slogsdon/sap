defmodule Sap.Combinators do
  @moduledoc """
  Conveniences for creating combinators.

  Combinators, a fancy name for simple functions meant to be composed with
  one another, are tasked with one of two goals:

    - filter requests based on some criteria
    - build up a response

  The power of these functions comes from the ability to compose them in any
  order. There is no clear separation of each type of combinators, so a
  filtering combinator can be used both before and after a building
  combinator and vice versa.
  """

  @typedoc "A combinator must accept a `Plug.Conn` and return `Sap.Context`."
  @type combinator :: (Plug.Conn.t -> C.t)
end
