defmodule Sap.Combinators.ClientErrorTest do
  use ExUnit.Case, async: true
  use Plug.Test
  import Sap.Combinators.ClientError

  test "bad_request without body" do
    conn = conn(:get, "/")
    resp = bad_request().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 400
    assert resp.conn.resp_body == ""
  end

  test "bad_request with body" do
    conn = conn(:get, "/")
    resp = bad_request("bad_request").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 400
    assert resp.conn.resp_body == "bad_request"
  end

  test "forbidden without body" do
    conn = conn(:get, "/")
    resp = forbidden().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 403
    assert resp.conn.resp_body == ""
  end

  test "forbidden with body" do
    conn = conn(:get, "/")
    resp = forbidden("forbidden").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 403
    assert resp.conn.resp_body == "forbidden"
  end

  test "unauthorized without body" do
    conn = conn(:get, "/")
    resp = unauthorized().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 401
    assert resp.conn.resp_body == ""
  end

  test "unauthorized with body" do
    conn = conn(:get, "/")
    resp = unauthorized("unauthorized").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 401
    assert resp.conn.resp_body == "unauthorized"
  end

  test "not_found without body" do
    conn = conn(:get, "/")
    resp = not_found().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 404
    assert resp.conn.resp_body == ""
  end

  test "not_found with body" do
    conn = conn(:get, "/")
    resp = not_found("not_found").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 404
    assert resp.conn.resp_body == "not_found"
  end

  test "method_not_allowed without body" do
    conn = conn(:get, "/")
    resp = method_not_allowed().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 405
    assert resp.conn.resp_body == ""
  end

  test "method_not_allowed with body" do
    conn = conn(:get, "/")
    resp = method_not_allowed("method_not_allowed").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 405
    assert resp.conn.resp_body == "method_not_allowed"
  end

  test "not_acceptable without body" do
    conn = conn(:get, "/")
    resp = not_acceptable().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 406
    assert resp.conn.resp_body == ""
  end

  test "not_acceptable with body" do
    conn = conn(:get, "/")
    resp = not_acceptable("not_acceptable").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 406
    assert resp.conn.resp_body == "not_acceptable"
  end

  test "proxy_authentication_required without body" do
    conn = conn(:get, "/")
    resp = proxy_authentication_required().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 407
    assert resp.conn.resp_body == ""
  end

  test "proxy_authentication_required with body" do
    conn = conn(:get, "/")
    resp = proxy_authentication_required("proxy_authentication_required").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 407
    assert resp.conn.resp_body == "proxy_authentication_required"
  end

  test "request_timeout without body" do
    conn = conn(:get, "/")
    resp = request_timeout().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 408
    assert resp.conn.resp_body == ""
  end

  test "request_timeout with body" do
    conn = conn(:get, "/")
    resp = request_timeout("request_timeout").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 408
    assert resp.conn.resp_body == "request_timeout"
  end

  test "conflict without body" do
    conn = conn(:get, "/")
    resp = conflict().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 409
    assert resp.conn.resp_body == ""
  end

  test "conflict with body" do
    conn = conn(:get, "/")
    resp = conflict("conflict").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 409
    assert resp.conn.resp_body == "conflict"
  end

  test "gone without body" do
    conn = conn(:get, "/")
    resp = gone().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 410
    assert resp.conn.resp_body == ""
  end

  test "gone with body" do
    conn = conn(:get, "/")
    resp = gone("gone").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 410
    assert resp.conn.resp_body == "gone"
  end

  test "length_required without body" do
    conn = conn(:get, "/")
    resp = length_required().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 411
    assert resp.conn.resp_body == ""
  end

  test "length_required with body" do
    conn = conn(:get, "/")
    resp = length_required("length_required").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 411
    assert resp.conn.resp_body == "length_required"
  end

  test "precondition_failed without body" do
    conn = conn(:get, "/")
    resp = precondition_failed().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 412
    assert resp.conn.resp_body == ""
  end

  test "precondition_failed with body" do
    conn = conn(:get, "/")
    resp = precondition_failed("precondition_failed").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 412
    assert resp.conn.resp_body == "precondition_failed"
  end

  test "payload_too_large without body" do
    conn = conn(:get, "/")
    resp = payload_too_large().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 413
    assert resp.conn.resp_body == ""
  end

  test "payload_too_large with body" do
    conn = conn(:get, "/")
    resp = payload_too_large("payload_too_large").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 413
    assert resp.conn.resp_body == "payload_too_large"
  end

  test "uri_too_long without body" do
    conn = conn(:get, "/")
    resp = uri_too_long().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 414
    assert resp.conn.resp_body == ""
  end

  test "uri_too_long with body" do
    conn = conn(:get, "/")
    resp = uri_too_long("uri_too_long").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 414
    assert resp.conn.resp_body == "uri_too_long"
  end

  test "unsupported_media_type without body" do
    conn = conn(:get, "/")
    resp = unsupported_media_type().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 415
    assert resp.conn.resp_body == ""
  end

  test "unsupported_media_type with body" do
    conn = conn(:get, "/")
    resp = unsupported_media_type("unsupported_media_type").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 415
    assert resp.conn.resp_body == "unsupported_media_type"
  end

  test "requested_range_not_satisfiable without body" do
    conn = conn(:get, "/")
    resp = requested_range_not_satisfiable().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 416
    assert resp.conn.resp_body == ""
  end

  test "requested_range_not_satisfiable with body" do
    conn = conn(:get, "/")
    resp = requested_range_not_satisfiable("requested_range_not_satisfiable").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 416
    assert resp.conn.resp_body == "requested_range_not_satisfiable"
  end

  test "expectation_failed without body" do
    conn = conn(:get, "/")
    resp = expectation_failed().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 417
    assert resp.conn.resp_body == ""
  end

  test "expectation_failed with body" do
    conn = conn(:get, "/")
    resp = expectation_failed("expectation_failed").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 417
    assert resp.conn.resp_body == "expectation_failed"
  end

  test "upgrade_required without body" do
    conn = conn(:get, "/")
    resp = upgrade_required().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 426
    assert resp.conn.resp_body == ""
  end

  test "upgrade_required with body" do
    conn = conn(:get, "/")
    resp = upgrade_required("upgrade_required").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 426
    assert resp.conn.resp_body == "upgrade_required"
  end

  test "precondition_required without body" do
    conn = conn(:get, "/")
    resp = precondition_required().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 428
    assert resp.conn.resp_body == ""
  end

  test "precondition_required with body" do
    conn = conn(:get, "/")
    resp = precondition_required("precondition_required").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 428
    assert resp.conn.resp_body == "precondition_required"
  end

  test "too_many_requests without body" do
    conn = conn(:get, "/")
    resp = too_many_requests().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 429
    assert resp.conn.resp_body == ""
  end

  test "too_many_requests with body" do
    conn = conn(:get, "/")
    resp = too_many_requests("too_many_requests").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 429
    assert resp.conn.resp_body == "too_many_requests"
  end

  test "request_header_fields_too_large without body" do
    conn = conn(:get, "/")
    resp = request_header_fields_too_large().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 431
    assert resp.conn.resp_body == ""
  end

  test "request_header_fields_too_large with body" do
    conn = conn(:get, "/")
    resp = request_header_fields_too_large("request_header_fields_too_large").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 431
    assert resp.conn.resp_body == "request_header_fields_too_large"
  end

  test "unavailable_for_legal_reasons without body" do
    conn = conn(:get, "/")
    resp = unavailable_for_legal_reasons().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 451
    assert resp.conn.resp_body == ""
  end

  test "unavailable_for_legal_reasons with body" do
    conn = conn(:get, "/")
    resp = unavailable_for_legal_reasons("unavailable_for_legal_reasons").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 451
    assert resp.conn.resp_body == "unavailable_for_legal_reasons"
  end

end