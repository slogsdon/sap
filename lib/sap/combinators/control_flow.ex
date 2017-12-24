defmodule Sap.Combinators.ControlFlow do
  @moduledoc """
  Request filters for controlling how a Sap decision tree finds a success path
  """

  import Sap.Context, only: [new: 1, error: 1]

  @doc """
  Allows for multiple options at a decision tree node. `choose/1` combinators
  can be nested to create multiple decision paths.
  """
  @spec choose([Sap.Combinators.combinator]) :: Sap.Combinators.combinator
  def choose(parts) do
    fn conn ->
      choose_parts(conn, parts)
    end
  end

  defp choose_parts(conn, []) do
    conn |> new() |> error
  end
  defp choose_parts(conn, [part | rest]) do
    case part.(conn) do
      %Sap.Context{status: :error} -> choose(rest).(conn)
      resp -> resp
    end
  end

  @doc """
  Filters out requests that do not match a given `path`. The filter depends
  on an exact match of the requested path and does not yet support
  capturing path segments.
  """
  @spec path(String.t) :: Sap.Combinators.combinator
  def path(path) do
    cp = path |> compile_path
    fn
      %{path_info: pi} = conn when pi == cp ->
        new(conn)
      conn ->
        conn |> new() |> error
    end
  end

  defp compile_path(path) do
    path
    |> String.trim("/")
    |> String.split("/")
    |> Enum.filter(fn x -> x != "" end)
  end
end
