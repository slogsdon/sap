defmodule Sap.Context do
  @moduledoc """
  A data type to hold both the connection data and the status of a decision
  path.
  """

  @type t :: %__MODULE__{
    status: :ok | :error,
    conn: Plug.Conn.t
  }

  defstruct status: :ok,
            conn: nil

  @doc """
  Creates a `Sap.Context` from a `Plug.Conn`. The created context has a
  status of `:ok`.
  """
  @spec new(Plug.Conn.t) :: t
  def new(conn) do
    __MODULE__ |> struct(conn: conn)
  end

  @doc """
  Updates a `Sap.Context` to set the status to `:error`. In a decision path,
  this is used to halt the processing in the rest of the path.
  """
  @spec error(t) :: t
  def error(context) do
    %{context | status: :error}
  end
end

defimpl Control.Monad, for: Sap.Context do
  alias Sap.Context, as: C
  def return(context, nil), do: context
  def return(%C{conn: nil}, conn) do
    C.new(conn)
  end

  def bind(%C{status: :error} = c, _), do: c
  def bind(context, fun) do
    context.conn |> fun.()
  end
end
