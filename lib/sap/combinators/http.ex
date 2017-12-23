defmodule Sap.Combinators.Http do
  @moduledoc """

  """

  import Sap.Context, only: [new: 1, error: 1]

  @methods [
    :get,
    :post,
    :put,
    :patch,
    :delete,
    :head,
    :options,
    :trace,
  ]

  for method <- @methods do
    method_str = method |> to_string() |> String.upcase

    @doc """
    Only permits HTTP #{method_str} requests in the rest of a tree's definition.
    """
    @spec unquote(method)() :: Sap.Combinators.combinator
    def unquote(method)() do
      fn
        %{method: unquote(method_str)} = conn -> new(conn)
        conn -> conn |> new() |> error
      end
    end
  end
end
