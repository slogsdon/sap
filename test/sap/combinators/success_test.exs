defmodule Sap.Combinators.SuccessTest do
  use ExUnit.Case, async: true
  use Plug.Test
  import Sap.Combinators.Success

  test "ok without body" do
    conn = conn(:get, "/")
    resp = ok().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 200
    assert resp.conn.resp_body == ""
  end

  test "ok with body" do
    conn = conn(:get, "/")
    resp = ok("ok").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 200
    assert resp.conn.resp_body == "ok"
  end

  test "created without body" do
    conn = conn(:get, "/")
    resp = created().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 201
    assert resp.conn.resp_body == ""
  end

  test "created with body" do
    conn = conn(:get, "/")
    resp = created("created").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 201
    assert resp.conn.resp_body == "created"
  end

  test "accepted without body" do
    conn = conn(:get, "/")
    resp = accepted().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 202
    assert resp.conn.resp_body == ""
  end

  test "accepted with body" do
    conn = conn(:get, "/")
    resp = accepted("accepted").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 202
    assert resp.conn.resp_body == "accepted"
  end

  test "no_content" do
    conn = conn(:get, "/")
    resp = no_content().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 204
    assert resp.conn.resp_body == ""
  end
end
