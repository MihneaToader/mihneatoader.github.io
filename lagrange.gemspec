# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "lagrange"
  spec.version       = "4.0.0"
  spec.authors       = ["Mihnea Toader"]
  spec.email         = [""]

  spec.summary       = "Personal portfolio using Jekyll and Lagrange"
  spec.homepage      = "https://github.com/MihneaToader/mihneatoader.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|CHANGELOG)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.6"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.3"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.6"

end
