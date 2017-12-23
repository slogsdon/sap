defmodule Sap.ContextTest do
  use ExUnit.Case, async: true
  use Plug.Test
  import Sap.Combinators.ControlFlow
  import Sap.Combinators.Http
  import Sap.Combinators.Success
  import Sap.Helpers

  test "return nil value" do
    context = Sap.Context.new(nil)

    assert context |> Control.Monad.return == context
  end

  test "return value" do
    context = Sap.Context.new(nil)

    assert context.conn == nil

    conn = conn(:get, "/")

    assert context |> Control.Monad.return(conn)
      == %{context | conn: conn}
  end

  test "bind :error" do
    conn = conn(:post, "/")
    app = get() ~>> ok("ok")
    resp = Sap.call(conn, app: app)

    refute resp.status == 200
    refute resp.resp_body == "ok"
  end

  test "bind :ok" do
    conn = conn(:get, "/")
    app = get() ~>> path("/") ~>> ok("ok")
    resp = Sap.call(conn, app: app)

    assert resp.status == 200
    assert resp.resp_body == "ok"
  end
end
