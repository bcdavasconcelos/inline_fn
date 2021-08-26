# frozen_string_literal: true

require_relative "lib/inline_fn/version"

Gem::Specification.new do |spec|
  spec.name          = "inline_fn"
  spec.version       = InlineFn::VERSION
  spec.authors       = ["Bernardo C.D.A. Vasconcelos"]
  spec.email         = ["35749099+bcdavasconcelos@users.noreply.github.com"]

  spec.summary       = "Change markdown footnotes format from `[^1]/[^1]:Note` to inline Pandoc or MMD style `^[Note]/[^Note]`."
  spec.description   = "There are two methods that work on strings. Use `str.inline_mmd` for Multimarkdown style or `str.inline_pandoc` for Pandoc style footnotes."
  spec.homepage      = "Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
