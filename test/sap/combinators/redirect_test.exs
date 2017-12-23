defmodule Sap.Combinators.RedirectTest do
  use ExUnit.Case, async: true
  use Plug.Test
  import Sap.Combinators.Redirect

  @location "http://foo/bar"

  test "moved_permanently" do
    conn = conn(:get, "/")
    resp = moved_permanently(@location).(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 301
    assert resp.conn.resp_body == nil
    assert resp.conn |> get_resp_header("location")
      == [@location]
  end

  test "found" do
    conn = conn(:get, "/")
    resp = found(@location).(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 302
    assert resp.conn.resp_body == nil
    assert resp.conn |> get_resp_header("location")
      == [@location]
  end

  test "see_other" do
    conn = conn(:get, "/")
    resp = see_other(@location).(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 303
    assert resp.conn.resp_body == nil
    assert resp.conn |> get_resp_header("location")
      == [@location]
  end

  test "not_modified" do
    conn = conn(:get, "/")
    resp = not_modified().(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 304
    assert resp.conn.resp_body == nil
    assert resp.conn |> get_resp_header("location")
      == []
  end

  test "temporary_redirect" do
    conn = conn(:get, "/")
    resp = temporary_redirect(@location).(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 307
    assert resp.conn.resp_body == nil
    assert resp.conn |> get_resp_header("location")
      == [@location]
  end

  test "permanent_redirect" do
    conn = conn(:get, "/")
    resp = permanent_redirect(@location).(conn)

    assert resp.status == :ok
    refute resp.conn == conn
    assert resp.conn.status == 308
    assert resp.conn.resp_body == nil
    assert resp.conn |> get_resp_header("location")
      == [@location]
  end
end
