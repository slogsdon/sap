defmodule Simple do
  @moduledoc """
  Documentation for Simple.
  """

  import Sap.Combinators
  import Sap.Helpers

  @doc """
  Hello world.

  ## Examples

      iex> Simple.hello
      :world

  """
  def hello do
    :world
  end

  def app do
    choose [
      get() ~>> resp_json() ~>> choose([
        path("/body2") ~>> ok("{\"data\": \"body 2\"}"),
        path("/body1") ~>> ok("{\"data\": \"body 1\"}")
        ])
      ]
  end
end
