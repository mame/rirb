= rirb

* http://github.com/mame/rirb/tree/master

== DESCRIPTION:

rirb (remote irb) allows you to attach a running ruby process and
to observe/modify global states via an irb prompt.

== FEATURES/PROBLEMS:


== SYNOPSIS:

  First, you should add -rrirb option for a target process:

  terminal 1:
    $ cat test.rb
    $i = 0
    loop do
      p $i
      $i += 1
      sleep 10
    end

    $ ruby -rrirb test.rb
    0
    1
    2

  you then run rirb in the same directory on another terminal and
  get irb prompt:

  terminal 2:
    $ rirb
    irb(main):001:0>

  You can observe global states:

  terminal 2:
    irb(main):001:0> p $i
    2
    => nil

  You can also modify:

  terminal 2:
    irb(main):002:0> $i = 100

  terminal 1:
    $ ruby -rrirb test.rb
    0
    1
    2
    100
    101
    102


== REQUIREMENTS:

None

== INSTALL:

* gem install mame-rirb

== LICENSE:

Copyright:: Yusuke Endoh <mame@tsg.ne.jp>
License:: Ruby's
