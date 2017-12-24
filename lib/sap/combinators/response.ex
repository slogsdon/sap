defmodule Sap.Combinators.Response do
  @moduledoc """
  General responsehelpers
  """

  import Plug.Conn
  import Sap.Context, only: [new: 1]
  import Sap.Helpers

  @spec response(integer | atom, String.t) :: Sap.Combinators.combinator
  def response(status, content) do
    set_status(status) ~>> set_content(content)
  end

  @spec set_content(String.t) :: Sap.Combinators.combinator
  def set_content(content) do
    fn conn ->
      conn
      |> Map.put(:resp_body, content)
      |> new
    end
  end

  @spec set_status(integer | atom) :: Sap.Combinators.combinator
  def set_status(status) do
    fn conn ->
      conn
      |> put_status(status)
      |> new
    end
  end

  @spec set_header(String.t, String.t) :: Sap.Combinators.combinator
  def set_header(key, value) do
    fn conn ->
      conn
      |> put_resp_header(key, value)
      |> new
    end
  end

  @spec set_user_data(String.t | atom, term) :: Sap.Combinators.combinator
  def set_user_data(key, value) do
    fn conn ->
      conn
      |> put_private(key, value)
      |> new
    end
  end

  @spec set_mime_type(String.t, String.t) :: Sap.Combinators.combinator
  def set_mime_type(type, encoding \\ "utf-8") do
    set_header("content-type", "#{type}; charset=#{encoding}")
  end

  @doc """
  Sets the response header for the rest of a node to `application/json`.
  """
  @spec json :: Sap.Combinators.combinator
  def json do
    set_mime_type("application/json")
  end
end
