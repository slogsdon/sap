defmodule Sap.Combinators.Error do
  @moduledoc """

  """

  import Sap.Combinators.Response

  @doc """
  Sets the response status code of `404 Not Found` and, if present, the
  given response body.
  """
  @spec not_found(String.t) :: Sap.Combinators.combinator
  def not_found(resp \\ "") do
    response(:not_found, resp)
  end
end
