defmodule Sap.Combinators.ClientError do
  @moduledoc """

  """

  import Sap.Combinators.Response

  @doc """
  This response means that server could not understand the request due to
  invalid syntax.
  """
  @spec bad_request(String.t) :: Sap.Combinators.combinator
  def bad_request(content \\ "") do
    response(:bad_request, content)
  end

  @doc """
  Although the HTTP standard specifies "unauthorized", semantically this
  response means "unauthenticated". That is, the client must authenticate
  itself to get the requested response.
  """
  @spec forbidden(String.t) :: Sap.Combinators.combinator
  def forbidden(content \\ "") do
    response(:forbidden, content)
  end

  @doc """
  The client does not have access rights to the content, i.e. they are
  unauthorized, so server is rejecting to give proper response. Unlike 401,
  the client's identity is known to the server.
  """
  @spec unauthorized(String.t) :: Sap.Combinators.combinator
  def unauthorized(content \\ "") do
    response(:unauthorized, content)
  end

  @doc """
  The server can not find requested resource. In the browser, this means the
  URL is not recognized. In an API, this can also mean that the endpoint is
  valid but the resource itself does not exist. Servers may also send this
  response instead of 403 to hide the existence of a resource from an
  unauthorized client. This response code is probably the most famous one due
  to its frequent occurence on the web.
  """
  @spec not_found(String.t) :: Sap.Combinators.combinator
  def not_found(content \\ "") do
    response(:not_found, content)
  end

  @doc """
  The request method is known by the server but has been disabled and cannot be
  used. For example, an API may forbid DELETE-ing a resource. The two mandatory
  methods, GET and HEAD, must never be disabled and should not return this
  error code.
  """
  @spec method_not_allowed(String.t) :: Sap.Combinators.combinator
  def method_not_allowed(content \\ "") do
    response(:method_not_allowed, content)
  end

  @doc """
  This response is sent when the web server, after performing server-driven
  content negotiation, doesn't find any content following the criteria given by
  the user agent.
  """
  @spec not_acceptable(String.t) :: Sap.Combinators.combinator
  def not_acceptable(content \\ "") do
    response(:not_acceptable, content)
  end

  @doc """
  This is similar to 401 but authentication is needed to be done by a proxy.
  """
  @spec proxy_authentication_required(String.t) :: Sap.Combinators.combinator
  def proxy_authentication_required(content \\ "") do
    response(:proxy_authentication_required, content)
  end

  @doc """
  This response is sent on an idle connection by some servers, even without any
  previous request by the client. It means that the server would like to shut
  down this unused connection. This response is used much more since some
  browsers, like Chrome, Firefox 27+, or IE9, use HTTP pre-connection
  mechanisms to speed up surfing. Also note that some servers merely shut down
  the connection without sending this message.
  """
  @spec request_timeout(String.t) :: Sap.Combinators.combinator
  def request_timeout(content \\ "") do
    response(:request_timeout, content)
  end

  @doc """
  This response is sent when a request conflicts with the current state of the
  server.
  """
  @spec conflict(String.t) :: Sap.Combinators.combinator
  def conflict(content \\ "") do
    response(:conflict, content)
  end

  @doc """
  This response would be sent when the requested content has been permenantly
  deleted from server, with no forwarding address. Clients are expected to
  remove their caches and links to the resource. The HTTP specification
  intends this status code to be used for "limited-time, promotional
  services". APIs should not feel compelled to indicate resources that have
  been deleted with this status code.
  """
  @spec gone(String.t) :: Sap.Combinators.combinator
  def gone(content \\ "") do
    response(:gone, content)
  end

  @doc """
  Server rejected the request because the Content-Length header field is not
  defined and the server requires it.
  """
  @spec length_required(String.t) :: Sap.Combinators.combinator
  def length_required(content \\ "") do
    response(:length_required, content)
  end

  @doc """
  The client has indicated preconditions in its headers which the server does
  not meet.
  """
  @spec precondition_failed(String.t) :: Sap.Combinators.combinator
  def precondition_failed(content \\ "") do
    response(:precondition_failed, content)
  end

  @doc """
  Request entity is larger than limits defined by server; the server might
  close the connection or return an Retry-After header field.
  """
  @spec payload_too_large(String.t) :: Sap.Combinators.combinator
  def payload_too_large(content \\ "") do
    response(413, content)
  end

  @doc """
  The URI requested by the client is longer than the server is willing to
  interpret.
  """
  @spec uri_too_long(String.t) :: Sap.Combinators.combinator
  def uri_too_long(content \\ "") do
    response(414, content)
  end

  @doc """
  The media format of the requested data is not supported by the server, so the
  server is rejecting the request.
  """
  @spec unsupported_media_type(String.t) :: Sap.Combinators.combinator
  def unsupported_media_type(content \\ "") do
    response(:unsupported_media_type, content)
  end

  @doc """
  The range specified by the Range header field in the request can't be
  fulfilled; it's possible that the range is outside the size of the target
  URI's data.
  """
  @spec requested_range_not_satisfiable(String.t) :: Sap.Combinators.combinator
  def requested_range_not_satisfiable(content \\ "") do
    response(:requested_range_not_satisfiable, content)
  end

  @doc """
  This response code means the expectation indicated by the Expect request
  header field can't be met by the server.
  """
  @spec expectation_failed(String.t) :: Sap.Combinators.combinator
  def expectation_failed(content \\ "") do
    response(:expectation_failed, content)
  end

  @doc """
  The server refuses to perform the request using the current protocol but
  might be willing to do so after the client upgrades to a different protocol.
  The server sends an Upgrade header in a 426 response to indicate the
  required protocol(s).
  """
  @spec upgrade_required(String.t) :: Sap.Combinators.combinator
  def upgrade_required(content \\ "") do
    response(:upgrade_required, content)
  end

  @doc """
  The origin server requires the request to be conditional. Intended to prevent
  the 'lost update' problem, where a client GETs a resource's state, modifies
  it, and PUTs it back to the server, when meanwhile a third party has modified
  the state on the server, leading to a conflict.
  """
  @spec precondition_required(String.t) :: Sap.Combinators.combinator
  def precondition_required(content \\ "") do
    response(:precondition_required, content)
  end

  @doc """
  The user has sent too many requests in a given amount of time ("rate
  limiting").
  """
  @spec too_many_requests(String.t) :: Sap.Combinators.combinator
  def too_many_requests(content \\ "") do
    response(:too_many_requests, content)
  end

  @doc """
  The server is unwilling to process the request because its header fields are
  too large. The request MAY be resubmitted after reducing the size of the
  request header fields.
  """
  @spec request_header_fields_too_large(String.t) :: Sap.Combinators.combinator
  def request_header_fields_too_large(content \\ "") do
    response(:request_header_fields_too_large, content)
  end

  @doc """
  The user requests an illegal resource, such as a web page censored by a
  government.
  """
  @spec unavailable_for_legal_reasons(String.t) :: Sap.Combinators.combinator
  def unavailable_for_legal_reasons(content \\ "") do
    response(451, content)
  end
end
