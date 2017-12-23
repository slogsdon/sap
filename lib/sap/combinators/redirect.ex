defmodule Sap.Combinators.Redirect do
  @moduledoc """

  """

  import Sap.Combinators.Response
  import Sap.Helpers

  @doc """
  This response code means that URI of requested resource has been changed.
  Probably, new URI would be given in the response.
  """
  @spec moved_permanently(String.t) :: Sap.Combinators.combinator
  def moved_permanently(location) do
    set_status(:moved_permanently)
    ~>> set_header("location", location)
  end

  @doc """
  This response code means that URI of requested resource has been changed
  temporarily. New changes in the URI might be made in the future. Therefore,
  this same URI should be used by the client in future requests.
  """
  @spec found(String.t) :: Sap.Combinators.combinator
  def found(location) do
    set_status(:found)
    ~>> set_header("location", location)
  end

  @doc """
  Server sent this response to directing client to get requested resource to
  another URI with an GET request.
  """
  @spec see_other(String.t) :: Sap.Combinators.combinator
  def see_other(location) do
    set_status(:see_other)
    ~>> set_header("location", location)
  end

  @doc """
  This is used for caching purposes. It is telling to client that response has
  not been modified. So, client can continue to use same cached version of
  response.
  """
  @spec not_modified() :: Sap.Combinators.combinator
  def not_modified do
    set_status(:not_modified)
  end

  @doc """
  Server sent this response to directing client to get requested resource to
  another URI with same method that used prior request. This has the same
  semantic than the 302 Found HTTP response code, with the exception that the
  user agent must not change the HTTP method used: if a POST was used in the
  first request, a POST must be used in the second request.
  """
  @spec temporary_redirect(String.t) :: Sap.Combinators.combinator
  def temporary_redirect(location) do
    set_status(:temporary_redirect)
    ~>> set_header("location", location)
  end

  @doc """
  This means that the resource is now permanently located at another URI,
  specified by the Location: HTTP Response header. This has the same semantics
  as the 301 Moved Permanently HTTP response code, with the exception that the
  user agent must not change the HTTP method used: if a POST was used in the
  first request, a POST must be used in the second request.
  """
  @spec permanent_redirect(String.t) :: Sap.Combinators.combinator
  def permanent_redirect(location) do
    set_status(:permanent_redirect)
    ~>> set_header("location", location)
  end
end
