defmodule Sap.Combinators.ServerErrorTest do
  use ExUnit.Case, async: true
  use Plug.Test
  import Sap.Combinators.ServerError

  test "internal_server_error without body" do
    conn = conn(:get, "/")
    resp = internal_server_error().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 500
    assert resp.conn.resp_body == ""
  end

  test "internal_server_error with body" do
    conn = conn(:get, "/")
    resp = internal_server_error("internal_server_error").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 500
    assert resp.conn.resp_body == "internal_server_error"
  end

  test "not_implemented without body" do
    conn = conn(:get, "/")
    resp = not_implemented().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 501
    assert resp.conn.resp_body == ""
  end

  test "not_implemented with body" do
    conn = conn(:get, "/")
    resp = not_implemented("not_implemented").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 501
    assert resp.conn.resp_body == "not_implemented"
  end

  test "bad_gateway without body" do
    conn = conn(:get, "/")
    resp = bad_gateway().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 502
    assert resp.conn.resp_body == ""
  end

  test "bad_gateway with body" do
    conn = conn(:get, "/")
    resp = bad_gateway("bad_gateway").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 502
    assert resp.conn.resp_body == "bad_gateway"
  end

  test "service_unavailable without body" do
    conn = conn(:get, "/")
    resp = service_unavailable().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 503
    assert resp.conn.resp_body == ""
  end

  test "service_unavailable with body" do
    conn = conn(:get, "/")
    resp = service_unavailable("service_unavailable").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 503
    assert resp.conn.resp_body == "service_unavailable"
  end

  test "gateway_timeout without body" do
    conn = conn(:get, "/")
    resp = gateway_timeout().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 504
    assert resp.conn.resp_body == ""
  end

  test "gateway_timeout with body" do
    conn = conn(:get, "/")
    resp = gateway_timeout("gateway_timeout").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 504
    assert resp.conn.resp_body == "gateway_timeout"
  end

  test "http_version_not_supported without body" do
    conn = conn(:get, "/")
    resp = http_version_not_supported().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 505
    assert resp.conn.resp_body == ""
  end

  test "http_version_not_supported with body" do
    conn = conn(:get, "/")
    resp = http_version_not_supported("http_version_not_supported").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 505
    assert resp.conn.resp_body == "http_version_not_supported"
  end

  test "network_authentication_required without body" do
    conn = conn(:get, "/")
    resp = network_authentication_required().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 511
    assert resp.conn.resp_body == ""
  end

  test "network_authentication_required with body" do
    conn = conn(:get, "/")
    resp = network_authentication_required(
      "network_authentication_required"
    ).(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 511
    assert resp.conn.resp_body == "network_authentication_required"
  end
end
