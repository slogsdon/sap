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

  alias Sap.Context, as: C
  import C, only: [new: 1, error: 1]
  import Plug.Conn

  @typedoc "A combinator must accept a `Plug.Conn` and return `Sap.Context`."
  @type combinator :: (Plug.Conn.t -> C.t)

  @doc """
  Allows for multiple options at a decision tree node. `choose/1` combinators
  can be nested to create multiple decision paths.
  """
  @spec choose([combinator]) :: combinator
  def choose(parts) do
    fn conn ->
      case parts do
        [] -> new(conn) |> error
        [part|rest] ->
          case part.(conn) do
            %C{status: :error} -> choose(rest).(conn)
            resp -> resp
          end
      end
    end
  end

  @doc """
  Filters out requests that do not match a given `path`. The filter depends
  on an exact match of the requested path and does not yet support
  capturing path segments.
  """
  @spec path(String.t) :: combinator
  def path(path) do
    cp = path |> compile_path
    fn
      %{path_info: pi} = conn when pi == cp ->
        new(conn)
      conn ->
        new(conn) |> error
    end
  end

  defp compile_path(path) do
    path
    |> String.trim("/")
    |> String.split("/")
    |> Enum.filter(fn x -> x != "" end)
  end

  @doc """
  Only permits HTTP GET requests in the rest of a node's definition.
  """
  @spec get :: combinator
  def get do
    fn
      %{method: "GET"} = conn -> new(conn)
      conn -> new(conn) |> error
    end
  end

  @doc """
  Sets the response header for the rest of a node to `application/json`.
  """
  @spec resp_json :: combinator
  def resp_json do
    fn conn ->
      conn
      |> Plug.Conn.put_resp_header("content-type", "application/json")
      |> new
    end
  end

  @doc """
  Sets the response status code of `200 Ok` and, if present, the given
  response body.
  """
  @spec ok :: combinator
  def ok do
    fn conn ->
      conn
      |> put_status(200)
      |> new
    end
  end
  @spec ok(String.t) :: combinator
  def ok(resp) do
    fn conn ->
      conn
      |> put_status(200)
      |> Map.put(:resp_body, resp)
      |> new
    end
  end
end
