module DevTools
  module RunEnv
    class OptParse
      def self.default_options
        {
          build:  true,
          bundle: false,
          run:    true,
          test:   false
        }
      end

      #
      # Return a structure describing the Options.
      #
      def self.parse(args, unit_testing=false)
        # The Options specified on the command line will be collected in *Options*.
        # We set default values here.
        opt_parse = DevTools::OptParse.new(name:     PROGRAM_NAME,
                                           version:  VERSION,
                                           defaults: default_options,
                                           testing:  unit_testing)

        parser = opt_parse.parser

        parser.banner = "Usage: #{DevTools::PROGRAM} [OPTIONS]"

        parser.separator ""
        parser.separator "[OPTIONS]"

        parser.separator ""
        parser.separator "Specific Options:"

        parser.on "-b", "--[no-]build", "[Don't] Run the build job" do |opt|
          Options.build = opt
        end

        parser.on "-B", "--[no-]bundle", "[Don't] Run the bundler job" do |opt|
          Options.bundle = opt
        end

        parser.on "-r", "--[no-]run", "[Don't] Run the server job" do |opt|
          Options.run = opt
        end

        parser.separator ""
        parser.separator "Common Options:"

        parser.parse!(args)

        return Options
      end
    end # class OptParse
  end # module RunEnv
end # module DevTools

