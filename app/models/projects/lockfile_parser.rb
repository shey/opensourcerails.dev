require 'bundler'

module Projects
  class LockfileParser
    def initialize(content)
      @content = content
    end

    def gem_names
      Bundler::LockfileParser.new(@content).dependencies.keys
    end
  end
end
