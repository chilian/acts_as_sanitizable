# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: acts_as_sanitizable 0.4.4 ruby lib

Gem::Specification.new do |s|
  s.name = "acts_as_sanitizable"
  s.version = "0.4.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Christoph Chilian", "Tobias Casper"]
  s.date = "2014-05-07"
  s.description = "Sanitizable concern to sanitize attributes the way you like"
  s.email = ["christoph@chilian.de", "tobias.casper@gmail.com"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "acts_as_sanitizable.gemspec",
    "lib/acts_as_sanitizable.rb",
    "lib/sanitizable.rb",
    "lib/sanitizable/attribute_sanitizer.rb",
    "lib/sanitizable/macro.rb",
    "lib/sanitizable/model.rb",
    "spec/db/database.yml",
    "spec/db/schema.rb",
    "spec/models/sanitizable_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/models.rb",
    "test/helper.rb",
    "test/test_acts_as_sanitizable.rb"
  ]
  s.homepage = "http://github.com/chilian/acts_as_sanitizable"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Sanitizable concern to sanitize attributes the way you like"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, ["< 5", ">= 3.2.0"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3"])
      s.add_development_dependency(%q<shoulda>, ["~> 3.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.14"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_development_dependency(%q<simplecov>, ["~> 0"])
      s.add_development_dependency(%q<activerecord>, ["< 5", ">= 2.3"])
      s.add_development_dependency(%q<activemodel>, ["< 5", ">= 3.2.0"])
      s.add_development_dependency(%q<coveralls>, ["~> 0"])
    else
      s.add_dependency(%q<rails>, ["< 5", ">= 3.2.0"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3"])
      s.add_dependency(%q<shoulda>, ["~> 3.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<rspec>, ["~> 2.14"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.14"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_dependency(%q<simplecov>, ["~> 0"])
      s.add_dependency(%q<activerecord>, ["< 5", ">= 2.3"])
      s.add_dependency(%q<activemodel>, ["< 5", ">= 3.2.0"])
      s.add_dependency(%q<coveralls>, ["~> 0"])
    end
  else
    s.add_dependency(%q<rails>, ["< 5", ">= 3.2.0"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3"])
    s.add_dependency(%q<shoulda>, ["~> 3.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<rspec>, ["~> 2.14"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.14"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0"])
    s.add_dependency(%q<simplecov>, ["~> 0"])
    s.add_dependency(%q<activerecord>, ["< 5", ">= 2.3"])
    s.add_dependency(%q<activemodel>, ["< 5", ">= 3.2.0"])
    s.add_dependency(%q<coveralls>, ["~> 0"])
  end
end

