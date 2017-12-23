defmodule Sap.Combinators.Success do
  @moduledoc """

  """

  import Sap.Combinators.Response

  @doc """
  Sets the response status code of `200 Ok` and, if present, the given
  response body.
  """
  @spec ok(String.t) :: Sap.Combinators.combinator
  def ok(resp \\ "") do
    response(:ok, resp)
  end
end
