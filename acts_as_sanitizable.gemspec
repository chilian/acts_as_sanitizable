# encoding: utf-8
Gem::Specification.new do |spec|
  spec.name = "acts_as_sanitizable"
  spec.version = "0.3.0"
  spec.required_rubygems_version = Gem::Requirement.new(">= 0") if spec.respond_to? :required_rubygems_version=
  spec.require_paths = ["lib"]
  spec.authors = ["Tobias Casper", "Christoph Chilian"]
  spec.date = "2014-04-15"
  spec.description = "acts_as_sanitizable for ActiveRecord"
  spec.summary = "An acts_as_sanitizable macro for ActiveRecord to sanitize attributes the way you like."
  spec.email = "christoph@chilian.de"
  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |file| File.basename(file) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.extra_rdoc_files = ["LICENSE.txt", "README.md", "README.rdoc"]
  spec.homepage = "http://github.com/chilian/acts_as_sanitizable"
  spec.licenses = "MIT"
  spec.rubygems_version = "2.2.2"

  if spec.respond_to? :specification_version then
    spec.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      spec.add_development_dependency(%q<rails>, ["< 5", ">= 3.2.0"])
      spec.add_development_dependency(%q<sqlite3>, [">= 0"])
      spec.add_development_dependency(%q<shoulda>, [">= 0"])
      spec.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      spec.add_development_dependency(%q<rspec>, ["~> 2.14.0"])
      spec.add_development_dependency(%q<rspec-rails>, [">= 0"])
      spec.add_development_dependency(%q<bundler>, ["~> 1.0"])
      spec.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      spec.add_development_dependency(%q<simplecov>, [">= 0"])
      spec.add_development_dependency(%q<activerecord>, [">= 2.3.5"])
      spec.add_development_dependency(%q<activemodel>, [">= 3.0.0"])
      spec.add_development_dependency(%q<factory_girl>, [">= 0"])
    else
      spec.add_dependency(%q<rails>, ["< 5", ">= 3.2.0"])
      spec.add_dependency(%q<sqlite3>, [">= 0"])
      spec.add_dependency(%q<shoulda>, [">= 0"])
      spec.add_dependency(%q<rdoc>, ["~> 3.12"])
      spec.add_dependency(%q<rspec>, ["~> 2.14.0"])
      spec.add_dependency(%q<rspec-rails>, [">= 0"])
      spec.add_dependency(%q<bundler>, ["~> 1.0"])
      spec.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      spec.add_dependency(%q<simplecov>, [">= 0"])
      spec.add_dependency(%q<activerecord>, [">= 2.3.5"])
      spec.add_dependency(%q<activemodel>, [">= 3.0.0"])
      spec.add_dependency(%q<factory_girl>, [">= 0"])
    end
  else
    spec.add_dependency(%q<rails>, ["< 5", ">= 3.2.0"])
    spec.add_dependency(%q<sqlite3>, [">= 0"])
    spec.add_dependency(%q<shoulda>, [">= 0"])
    spec.add_dependency(%q<rdoc>, ["~> 3.12"])
    spec.add_dependency(%q<rspec>, ["~> 2.14.0"])
    spec.add_dependency(%q<rspec-rails>, [">= 0"])
    spec.add_dependency(%q<bundler>, ["~> 1.0"])
    spec.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    spec.add_dependency(%q<simplecov>, [">= 0"])
    spec.add_dependency(%q<activerecord>, [">= 2.3.5"])
    spec.add_dependency(%q<activemodel>, [">= 3.0.0"])
    spec.add_dependency(%q<factory_girl>, [">= 0"])
  end
end

