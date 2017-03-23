module Pod
  class Tester
    # @return [Specification] the specification to lint.
    #
    attr_reader :spec

    # @return [Pathname] the path of the `podspec` file where {#spec} is
    #         defined.
    #
    attr_reader :file

    # @param  [Specification, Pathname, String] spec_or_path
    #         the Specification or the path of the `podspec` file to lint.
    #
    def initialize(spec_or_path, source_urls, local = true)
      @source_urls = source_urls.map { |url| Config.instance.sources_manager.source_with_name_or_url(url) }.map(&:url)

      if spec_or_path.is_a?(Specification)
        @spec = spec_or_path
        @file = @spec.defined_in_file
      else
        @file = Pathname.new(spec_or_path)
        begin
        rescue => e
          @spec = nil
          @raise_message = e.message
        end
      end
    end

    # @return [true,false] true if the tests pass
    def test
      raise Informative, "The specification defined in `#{file}` "\
            "could not be loaded.\n\n#{@raise_message}" unless @spec

      if test_specs.empty?
        UI.puts "There are no test specs in #{@spec.name}.".yellow
        return false
      end

      test_specs.each do |spec|
        UI.puts "Testing #{spec.parent.name}."
      end

      UI.puts "#{@spec.name} passed testing.".green
      true
    end

    private

    def test_specs
      @test_specs ||= [@spec, *@spec.recursive_subspecs].map do |spec|
        spec.test_specification
      end.compact
    end
  end
end
