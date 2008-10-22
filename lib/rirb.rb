require "socket"
require "tmpdir"

rirb_file = (ENV["RIRB_INFO_FILE"] || "$0-$$.rirb").gsub(/\$./) {|v| eval(v) }
rirb_sock = File.join(Dir.tmpdir, "rirb.#{ $$ }")

open(rirb_file, "w") do |f|
  f.puts "type: unix"
  f.puts "path: #{ rirb_sock }"
end

at_exit do
  begin; File.unlink(rirb_file); rescue Exception; end
  begin; File.unlink(rirb_sock); rescue Exception; end
end

start = false
Thread.abort_on_exception = true
Thread.new do
  UNIXServer.open(rirb_sock) do |serv|
    start = true
    first = true
    while sock = serv.accept
      if first
        require "irb"
        argv = ARGV.dup
        ARGV.clear
        IRB.setup(nil)
        require "rirb/remote-irb"
        ARGV.replace(argv)
        first = false
      end
      IRB.rirb(sock)
      sock.close
    end
  end
end

nil until start
