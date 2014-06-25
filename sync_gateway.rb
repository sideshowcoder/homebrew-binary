require "formula"

class SyncGateway < Formula
  homepage "http://developer.couchbase.com/mobile/develop/guides/sync-gateway/index.html"
  url "http://packages.couchbase.com/releases/couchbase-sync-gateway/1.0.0/couchbase-sync-gateway-enterprise_1.0.0_x86_64.zip"
  sha1 "71631024e7958127885cf59695261a631f81bb31"
  version "1.0.0"

  def install
    bin.install "couchbase-sync-gateway/bin/sync_gateway"
  end

  test do
    pid = fork { exec "#{bin}/sync_gateway" }
    sleep 1
    Process.kill("SIGINT", pid)
    Process.wait(pid)
  end
end
