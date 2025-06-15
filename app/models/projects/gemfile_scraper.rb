# frozen_string_literal: true

module Projects
  class GemfileScraper < GithubScraper
    attr_reader :gems

    def initialize(*)
      super
      @gems = []
    end

    def ref
      @project.branch.presence || @project.last_commit
    end

    def url
      "https://api.github.com/repos/#{@project.github}/contents/Gemfile.lock?ref=#{ref}"
    end

    def run
      response = get(url)

      unless response.success?
        Rails.logger.warn("Gemfile.lock not found for #{@project.github} at ref #{ref}")
        return
      end

      content = Base64.decode64(JSON.parse(response.to_s)['content']).force_encoding('UTF-8')
      @gems = LockfileParser.new(content).gem_names
    end
  end
end
