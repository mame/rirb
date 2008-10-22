# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rirb}
  s.version = "0.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yusuke Endoh"]
  s.date = %q{2008-10-22}
  s.default_executable = %q{rirb}
  s.description = %q{rirb (remote irb) allows you to attach a running ruby process and to observe/modify global states via an irb prompt.}
  s.email = ["mame@tsg.ne.jp"]
  s.executables = ["rirb"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/rirb", "lib/rirb.rb", "lib/rirb/remote-irb.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/mame/rirb/tree/master}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rirb}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{rirb (remote irb) allows you to attach a running ruby process and to observe/modify global states via an irb prompt.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
