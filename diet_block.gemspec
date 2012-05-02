$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "diet_block/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "diet_block"
  s.version     = DietBlock::VERSION
  s.authors     = ["David Aaron Fendley"]
  s.email       = ["tricon@me.com"]
  s.homepage    = "http://triconium.com"
  s.summary     = "GenkiBlock addon for diets."
  s.description = "GenkiBlock addon for diets."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  s.add_dependency 'deep_cloneable', '~> 1.4.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "sqlite3"
end
