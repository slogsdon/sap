defmodule Sap.Combinators.HttpTest do
  use ExUnit.Case, async: true
  use Plug.Test
  import Sap.Combinators.Http

  test "get no match" do
    conn1 = conn(:post, "/")
    resp1 = get().(conn1)

    assert resp1.status == :error
    assert resp1.conn == conn1

    conn2 = conn(:put, "/")
    resp2 = get().(conn2)

    assert resp2.status == :error
    assert resp2.conn == conn2

    conn3 = conn(:delete, "/")
    resp3 = get().(conn3)

    assert resp3.status == :error
    assert resp3.conn == conn3
  end

  test "get match" do
    conn = conn(:get, "/")
    resp = get().(conn)

    assert resp.status == :ok
    assert resp.conn == conn
  end
end
