defmodule Sap do
  @moduledoc """
  Sap is a toolkit for Plug applications to accept and respond to HTTP
  requests by using a decision tree built with combinators.

  ## Making a decision with combinators

  In most Plug applications, there is some sort of match and/or dispatch
  process that takes place for an individual request. A request will come
  in, a set of pattern matching statements created will be compared against
  the requested path, and if there's a match, a function will be called to
  send the client a response. Here, there is a clear separation between
  matching/filtering a request and creating a response.

  With Sap, the basic idea remains the same, but the way a request is
  accepted and a response is created is slightly different. Combinators, a
  fancy name for simple functions meant to be composed with one another, are
  tasked with one of two goals:

    - filter requests based on some criteria
    - build up a response

  The power of these functions comes from the ability to compose them in any
  order. There is no clear separation of each type of combinators, so a
  filtering combinator can be used both before and after a building
  combinator and vice versa.

  ## Example

  To help demonstrate this, let's walk through a small example.

      def app do
        choose [
          get ~>> resp_json ~>> choose [
            path("/body2") ~>> ok("{\"data\": \"body 2\"}"),
            path("/body1") ~>> ok("{\"data\": \"body 1\"}")
            ]
          ]
      end

      Sap.start(app: app)
      # or Plug.Adapters.Cowboy.http Sap, [app: app], []

  A few combinators are used, both filtering and building, to define our
  application, with all of them working together to create a decision tree
  for dealing with requests.

  `choose/1` allows for multiple options at a decision tree node. `get/0`
  only permits HTTP GET requests in the rest of a node's definition.
  `resp_json/0` sets the response header for the rest of a node to
  `application/json`. `path/1` filters out requests that do not match a
  given path. `ok/1` sets the response status code of `200 Ok` and the given
  response body.

  With the above example, all POST, PUT, PATCH, etc. requests would not be
  handled. There was an explicit declaration that only GET requests are
  allowed since there is only one option in the first `choose/1` list. At
  the second `choose/1` list, the application has two options, `/body1` and
  `/body2`.

  These combinators work together through a `Sap.Context` struct that is
  passed between them that holds a `Plug.Conn` and a status for the current
  decision path. As long as the status is `:ok`, further combinators can
  affect the decision, but once the status is `:error`, the decision path
  effectively ends, giving way to the next option path.
  """

  use Application
  alias Sap.Context, as: C

  @behaviour Plug

  @doc """
  Convenience function to start a Plug adapter with Sap as the plug.

  ## Options

  - `:app` - (required) - the Sap app decision tree. An `ArgumentError`
      will be raised if this option is not passed.

  - `:scheme` - desired scheme on which the Plug adapter should attach
      (defaults to `:http`)

  ## Adapter Options

  - `:adapter` - desired Plug adapter (defaults to `Plug.Adapters.Cowboy`)

  See [the Plug docs](http://hexdocs.pm/plug/) for a detailed list of
  possible adapter options.
  """
  @spec serve(Keyword.t, Keyword.t) :: {:ok, pid} | {:error, term}
  def serve(opts \\ [], adapter_opts \\ []) do
    unless opts[:app] do
      raise ArgumentError, message: "missing `:app` option key"
    end

    adapter = adapter_opts[:adapter] || Plug.Adapters.Cowboy
    adapter_opts = adapter_opts |> Keyword.delete(:adapter)

    case opts[:scheme] || :http do
      :http -> adapter.http __MODULE__, opts, adapter_opts
      :https -> adapter.https __MODULE__, opts, adapter_opts
    end
  end

  # Plug callbacks

  @spec init(Keyword.t) :: Keyword.t
  def init(opts), do: opts

  @spec call(Plug.Conn.t, Keyword.t) :: Plug.Conn.t
  def call(conn, opts) do
    app = opts[:app]

    case app.(conn) do
      %C{status: :error} ->
        conn
        |> Plug.Conn.resp(400, "Bad Request")
      context ->
        context.conn
        |> Map.put(:state, :set)
    end
    |> Plug.Conn.send_resp
  end

  # Application callback

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    opts = [strategy: :one_for_one, name: Sap.Supervisor]
    Supervisor.start_link([], opts)
  end
end
