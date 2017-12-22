defmodule Sap.Helpers do
  @moduledoc """
  Conveniences for working with combinators to define a Sap app decision
  tree.
  """

  @compile {:inline, ~>>: 2}

  @doc """
  Allows for stringing combinators together
  """
  def left ~>> right do
    fn conn ->
      conn
      |> left.()
      |> Control.Monad.bind(right)
    end
  end
end
