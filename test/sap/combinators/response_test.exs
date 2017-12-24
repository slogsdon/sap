defmodule Sap.Combinators.ResponseTest do
  use ExUnit.Case, async: true
  use Plug.Test
  import Sap.Combinators.Response

  test "json" do
    conn = conn(:get, "/")
    resp = json().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn |> get_resp_header("content-type")
      == ["application/json; charset=utf-8"]
  end

  test "set_user_data" do
    conn = conn(:get, "/")
    resp = set_user_data(:foo, "bar").(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.private.foo == "bar"
  end
end
