defmodule Sap.Combinators.Success do
  @moduledoc """
  Success responses
  """

  import Sap.Combinators.Response

  @doc """
  The request has succeeded. The meaning of a success varies depending on the
  HTTP method:

  - GET: The resource has been fetched and is transmitted in the message body.
  - HEAD: The entity headers are in the message body.
  - POST: The resource describing the result of the action is transmitted in
    the message body.
  - TRACE: The message body contains the request message as received by the
    server
  """
  @spec ok(String.t) :: Sap.Combinators.combinator
  def ok(content \\ "") do
    response(:ok, content)
  end

  @doc """
  The request has succeeded and a new resource has been created as a result of
  it. This is typically the response sent after a PUT request.
  """
  @spec created(String.t) :: Sap.Combinators.combinator
  def created(content \\ "") do
    response(:created, content)
  end

  @doc """
  The request has been received but not yet acted upon. It is non-committal,
  meaning that there is no way in HTTP to later send an asynchronous response
  indicating the outcome of processing the request. It is intended for cases
  where another process or server handles the request, or for batch processing.
  """
  @spec accepted(String.t) :: Sap.Combinators.combinator
  def accepted(content \\ "") do
    response(:accepted, content)
  end

  @doc """
  There is no content to send for this request, but the headers may be useful.
  The user-agent may update its cached headers for this resource with the new
  ones.
  """
  @spec no_content() :: Sap.Combinators.combinator
  def no_content do
    response(:no_content, "")
  end
end
