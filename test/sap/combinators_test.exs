defmodule Sap.CombinatorsTest do
  use ExUnit.Case, async: true
  use Plug.Test
  import Sap.Combinators

  test "choose empty list" do
    conn = conn(:get, "/")
    resp = choose([]).(conn)

    assert resp.status == :error
    assert resp.conn == conn
  end

  test "choose no match" do
    conn = conn(:post, "/")
    resp = choose([get]).(conn)

    assert resp.status == :error
    assert resp.conn == conn
  end

  test "choose match" do
    conn = conn(:get, "/")
    resp = choose([ok("ok")]).(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 200
    assert resp.conn.resp_body == "ok"
  end

  test "path no match" do
    conn1 = conn(:get, "/req1")
    resp1 = path("/").(conn1)

    assert resp1.status == :error
    assert resp1.conn == conn1

    conn2 = conn(:get, "/req2")
    resp2 = path("/nope").(conn2)

    assert resp2.status == :error
    assert resp2.conn == conn2
  end

  test "path match" do
    conn1 = conn(:get, "/")
    resp1 = path("/").(conn1)

    assert resp1.status == :ok
    assert resp1.conn == conn1

    conn2 = conn(:get, "/req2")
    resp2 = path("/req2").(conn2)

    assert resp2.status == :ok
    assert resp2.conn == conn2
  end

  test "get no match" do
    conn1 = conn(:post, "/")
    resp1 = get.(conn1)

    assert resp1.status == :error
    assert resp1.conn == conn1

    conn2 = conn(:put, "/")
    resp2 = get.(conn2)

    assert resp2.status == :error
    assert resp2.conn == conn2

    conn3 = conn(:delete, "/")
    resp3 = get.(conn3)

    assert resp3.status == :error
    assert resp3.conn == conn3
  end

  test "get match" do
    conn = conn(:get, "/")
    resp = get.(conn)

    assert resp.status == :ok
    assert resp.conn == conn
  end

  test "resp_json" do
    conn = conn(:get, "/")
    resp = resp_json.(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn |> get_resp_header("content-type")
      == ["application/json"]
  end

  test "ok without body" do
    conn = conn(:get, "/")
    resp = ok.(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 200
    assert resp.conn.resp_body == nil
  end

  test "ok with body" do
    conn = conn(:get, "/")
    resp = ok("ok").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 200
    assert resp.conn.resp_body == "ok"
  end
end
