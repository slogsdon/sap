defmodule Sap.Combinators.ServerError do
  @moduledoc """
  Error responses caused by server behavior
  """

  import Sap.Combinators.Response

  @doc """
  The server has encountered a situation it doesn't know how to handle.
  """
  @spec internal_server_error(String.t) :: Sap.Combinators.combinator
  def internal_server_error(content \\ "") do
    response(:internal_server_error, content)
  end

  @doc """
  The request method is not supported by the server and cannot be handled.
  The only methods that servers are required to support (and therefore that
  must not return this code) are GET and HEAD.
  """
  @spec not_implemented(String.t) :: Sap.Combinators.combinator
  def not_implemented(content \\ "") do
    response(:not_implemented, content)
  end

  @doc """
  This error response means that the server, while working as a gateway to
  get a response needed to handle the request, got an invalid response.
  """
  @spec bad_gateway(String.t) :: Sap.Combinators.combinator
  def bad_gateway(content \\ "") do
    response(:bad_gateway, content)
  end

  @doc """
  The server is not ready to handle the request. Common causes are a server
  that is down for maintenance or that is overloaded. Note that together with
  this response, a user-friendly page explaining the problem should be sent.
  This responses should be used for temporary conditions and the Retry-After:
  HTTP header should, if possible, contain the estimated time before the
  recovery of the service. The webmaster must also take care about the
  caching-related headers that are sent along with this response, as these
  temporary condition responses should usually not be cached.
  """
  @spec service_unavailable(String.t) :: Sap.Combinators.combinator
  def service_unavailable(content \\ "") do
    response(:service_unavailable, content)
  end

  @doc """
  This error response is given when the server is acting as a gateway and
  cannot get a response in time.
  """
  @spec gateway_timeout(String.t) :: Sap.Combinators.combinator
  def gateway_timeout(content \\ "") do
    response(:gateway_timeout, content)
  end

  @doc """
  The HTTP version used in the request is not supported by the server.
  """
  @spec http_version_not_supported(String.t) :: Sap.Combinators.combinator
  def http_version_not_supported(content \\ "") do
    response(:http_version_not_supported, content)
  end

  @doc """
  The 511 status code indicates that the client needs to authenticate to gain
  network access.
  """
  @spec network_authentication_required(String.t) :: Sap.Combinators.combinator
  def network_authentication_required(content \\ "") do
    response(:network_authentication_required, content)
  end
end
