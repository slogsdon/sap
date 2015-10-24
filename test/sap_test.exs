defmodule SapTest do
  use ExUnit.Case, async: true
  use Plug.Test

  test "serve without proper app" do
    assert_raise ArgumentError, fn ->
      Sap.serve
    end
  end

  test "serve http with proper app" do
    assert_raise RuntimeError, ~r/could not start the cowboy application/, fn ->
      Sap.serve(app: fn conn -> conn end)
    end
  end

  test "serve https with proper app" do
    assert_raise RuntimeError, ~r/could not start the cowboy application/, fn ->
      Sap.serve(app: fn conn -> conn end,
                scheme: :https)
    end
  end

  test "init" do
    f = fn -> end
    assert Sap.init([]) == []
    assert Sap.init([app: f]) == [app: f]
  end

  test "call with :error status" do
    f = fn conn ->
      conn
      |> Sap.Context.new
      |> Sap.Context.error
    end
    resp = Sap.call(conn(:get, "/"), [app: f])

    assert resp.status == 400
    assert resp.resp_body == "Bad Request"
  end

  test "call with :ok status" do
    f = fn conn ->
      conn
      |> Plug.Conn.send_resp(200, "Ok")
      |> Sap.Context.new
    end
    resp = Sap.call(conn(:get, "/"), [app: f])

    assert resp.status == 200
    assert resp.resp_body == "Ok"
  end
end
