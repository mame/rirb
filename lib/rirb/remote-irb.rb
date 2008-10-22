require "irb"

module IRB
  class RemoteInputMethod < StdioInputMethod
    def initialize(io)
      super()
      @io = io
      @line = []
    end
    def gets
      @io.print @prompt
      line = @io.gets
      @line << line
      line
    end
    def eof?
      @io.eof?
    end
    def line(line_no)
      @line[line_no]
    end
  end

  class RemoteOutputMethod < OutputMethod
    def initialize(io)
      @io = io
    end
    def print(*opts)
      @io.print(*opts)
    end
  end

  class Irb
    def print(*args)
      @@rirb_io.print(*args)
    end
    def printf(*args)
      @@rirb_io.printf(*args)
    end
  end

  top = TOPLEVEL_BINDING.eval("self")
  def top.to_s
    "rirb:" + $0
  end
  def top.rp(*args)
    args.each {|a| Irb.class_eval("@@rirb_io").puts a.inspect }
    args.size == 0 ? nil : args.size == 1 ? args.first : args
  end

  def IRB.rirb(io)
    im = RemoteInputMethod.new(io)
    om = RemoteOutputMethod.new(io)
    Irb.class_eval("@@rirb_io = io")
    irb = Irb.new(nil, im, om)

    @CONF[:MAIN_CONTEXT] = irb.context
    @CONF[:PROMPT_MODE] = :DEFAULT
    catch(:IRB_EXIT) { irb.eval_input }

  rescue Exception
  ensure
    Irb.class_eval { remove_class_variable(:@@rirb_io) } rescue nil
  end
end
