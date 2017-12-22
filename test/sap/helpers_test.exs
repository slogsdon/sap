defmodule Sap.HelpersTest do
  use ExUnit.Case, async: true
  use Plug.Test
  import Sap.Combinators
  import Sap.Helpers

  test "~>>" do
    conn = conn(:get, "/")
    app = get() ~>> path("/") ~>> ok("ok")
    resp = Sap.call(conn, app: app)

    assert resp.status == 200
    assert resp.resp_body == "ok"
  end
end
